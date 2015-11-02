WDI
======
## Acts as Commentable

###Learning Objectives:

- A quick step-by-step guide to how to implement ActsAsCommentable

<br>
---

| **Section** | **Timing** | **Summary** |
|-------------|------------|-------------|
| **Opening** | 10 mins | Intro to the commenting gems     
| **We Do**: Starter code | 10 mins | Send over the starter code
| **We Do**: Add ActsAsCommentable Gem | 10 mins | Add the gem and run the generator
| **We Do**: Make Post model commentable | 15 mins | Making the posts model commentable               
| **We Do**: Make a comments controller | 15 mins | Making a comments controller                  
| **We Do**: Controller actions | 15 mins | Making the controller actions for the comments controller
| **We Do**: Display comments | 15 mins | Create the partial for displaying a comment
| **Closure** | 10 mins | Summary of the lesson 
| **Questions** | 10 mins | Any questions?

<br>
---

###Connection to a long term learning goal 

N/A.

<br>
---

###Before Class (Student Pre-work)

N/A.

<br>
---

###Related Homework	

<br>
---

Acts as Commentable
=====
[i]: Rails 4.2.1
[i]: Acts as Commentable 4.0.2
[i]: Devise 3.4.1

## Opening

There are a number of different commenting gems. We use them a lot in different projects, however some don't have particularly good instructions. 

Some of the popular gems are:

- [ActsAsCommentable](https://github.com/jackdempsey/acts_as_commentable)
- [ActsAsCommentable with threading](https://github.com/elight/acts_as_commentable_with_threading)
- [Commentator](https://github.com/marksim/commentator)

We're going to look at the first one, ActsAsCommentable.

<br>

## We Do: Starter code

Send over the start code which has:

- Devise (with views)
- Devise User Model with name added
- Post Model

A basic navigation in application.html.erb.

#### Create a new user and a new post

Register a new user and a new post.

<br>

## We Do: Add ActsAsCommentable Gem

We need to first add the gem 'acts_as_commentable'. I would recommend to add the version number:

```
gem 'acts_as_commentable', '4.0.2'
```

And:

```
$ bundle
```

#### Run the generator

This installs a generator which you can run with:

```
$ rails g comment
```

This will create you a comment model and a new migration:

```
create  app/models/comment.rb
create  db/migrate/20150506083404_create_comments.rb
```

Now let's look in the migration:

```
class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :title, :limit => 50, :default => "" 
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.references :user
      t.string :role, :default => "comments"
      t.timestamps
    end

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
    add_index :comments, :user_id
  end

  def self.down
    drop_table :comments
  end
end
```

#### Polymorphic relationship?

You can see that the comment's table has a polymorphic relationship. This allows you to comment on multiple types of object.

```
t.references :commentable, :polymorphic => true
```

This will generate two fields in the database:

```
t.integer  "commentable_id"
t.string   "commentable_type"
```

These work as a pair so that you can comment upon multiple object types.

Let's rake the database:

```
rake db:migrate
```

You can have a look at the table fields in the schema file.

```
db > schema.rb
```

<br>

## We Do: Make Post model commentable

To do this, all you need to do is to add `acts_as_commentable` into the model that we want to allow comments on:

```
class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_commentable
end
```

That's it!

<br>

## We Do: Make a comments controller

We need to create a comments controller in order to handle making and deleting comments:

```
$ touch app/controllers/comments_controller.rb
```

Inside this controller, we need to make the comments controller inherit from ApplicationController and add some actions for creating and destroying comments:

```
class CommentsController < ApplicationController
  before_action :set_commentable
  
  def create
    @comment = @commentable.comments.build(comments_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: "Thanks for commenting." }
      else
        format.html { redirect_to @commentable, notice: "Comment wasn't successfully created." }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to @commentable, notice: "Your comment was successfully destroyed."}
      format.json { head :no_content }
    end
  end
  
  protected
    def set_commentable
      @commentable = params[:commentable_type].camelize.constantize.find(params[:commentable_id])
    end

    def comments_params
      params.require(:comment).permit(:title, :comment)
    end
end
```

Let's go through this:

#### set_commentable?

We have seen before_action code in our other controllers. What do they normally do? Let's have a look at the `PostsController`:

```
def set_post
  @post = Post.find(params[:id])
end
```

We use it for the member actions `[:show, :edit, :update, :destroy]` in order to find the object we want to look at and DRY up our code.

Now let's compare that with the code in `:set_commentable`:

```
def set_commentable
  @commentable = params[:commentable_type].camelize.constantize.find(params[:commentable_id])
end
```

Let's break it down:

```
params[:commentable_type]
```

`:commentable_type` in the params hash will be a string of a class of object, e.g:

```
"post"
```

We can't use an ActiveRecord method on a String. We need to turn it into a class:

```
params[:commentable_type] 
=> "post"

"post".camelize
=> "Post"

"Post".constantize
=> Post (now a class)
```

Now we can use ActiveRecord methods on it.

```
Post.find(params[:commentable_id])
```

We will take the id of the commentable object that we want to comment on and use it to find the object. We save that object to an instance variable `@commentable`.


## We: Controller actions

#### Create

Let's look at the create action:

```
  def create
    @comment = @commentable.comments.build(comments_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: "Thanks for commenting." }
      else
        format.html { redirect_to @commentable, notice: "Comment wasn't successfully created." }
      end
    end
  end
```

Our commentable object has_many comments as we added: 

```
acts_as_commentable
``` 

into the Post model. This means we have the relationshio:

```
@commentable.comments
```

We build (similar to new) a new comment using `comments_params` method but don't save it yet:

```
@comment = @commentable.comments.build(comments_params)
```

We are using strong parameters as we do in the create action of the Post controller:

```
@post = Post.new(post_params)
```

We then assign the user as the current user:

```
@comment.user = current_user
```

Then we save and we return them to the commentable object.

#### Destroy

With that in mind, the destroy should be quite easy to understand:

```
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to @commentable, notice: "Your comment was successfully destroyed."}
      format.json { head :no_content }
    end
  end
```

<br>

## We Do: Create views

We need to create some views for the comments, especially a form to make new comments and a partial to display comments:

```
mkdir app/views/comments
touch app/views/comments/_form.html.erb
touch app/views/comments/_comment.html.erb
```

#### Form

Let's add some code into the comments _form.html.erb:

```
<%= form_for(:comment, url: comments_path(commentable_type: commentable.class.to_s.underscore, commentable_id: commentable.id)) do |f| %>

  <%= f.text_area :title, placeholder: "Add a title" %>
  <%= f.text_area :comment, placeholder: "Write a Comment" %>
  <%= f.submit "Comment!" %>

<% end %>
```

Here we creating a form for creating comments that posts to the comments_path (create action). We also submit in the params:

```
commentable_type: commentable.class.to_s.underscore
```
and

```
commentable_id: commentable.id
```

#### Add this form to the show page

We need to add this partial to the show page:

```
<%= render partial: 'comments/form', locals: { commentable: @post } %>
```

Here we are rendering the comments/form partial but saving a local variable of commentable (to use inside the partial) as the post.

Let's check this out in the browser.

We get an error!

#### Routes

We need to add routes:

```
resources :comments, only: [:create, :destroy]
```

And refresh the page. You should now see the comments form.

#### Create a new comment

Add a new comment. You won't be able to see it because we haven't displayed comments on the page.

<br>

## We Do: Display comments

Now we need to display the comments:

#### Comment view

Let's add some code to _comment.html.erb:

```
<li>
  <ul>
    <li><%= comment.user.try(:name) %></li>
    <li><%= comment.title %></li>
    <li><%= comment.comment %></li>
    <li><%= link_to 'Delete Comment', comment_path(comment, commentable_type: commentable.class.to_s.underscore, commentable_id: commentable.id), method: :delete, data: { confirm: 'Are you sure?' } %></li>
  </ul>
</li> 
```

And we need to render this underneath the form on the show page:

```
<%= render partial: 'comments/comment', collection: @comments, locals: { commentable: @post } %>
```

Nothing...

#### @comments

Now in the PostsController, we need to create an instance variable:

```
  def show
    @comments = @post.comments
  end
```

Now let's refresh the page.

Your comments should be displaying!

#### Test the delete button

Now you can test the delete button to check whether it's working!

<br>

## Closure

Summary of the lesson.

<br>

### Questions

Any questions.

<br>