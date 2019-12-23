json.array! @products do |product|
  json.id product.id
  json.title product.title
  json.movie product.movie
  json.image product.image
  json.price product.price
  json.user_id product.user_id
  json.information product.information
  json.user_sign_in current_user
end