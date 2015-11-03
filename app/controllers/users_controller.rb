def users_params
  params.require(:user).permit(:name, :graffiti_image)
end