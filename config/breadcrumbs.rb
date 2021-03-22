crumb :root do
  link "Home", root_path
end

crumb :items_show do
  if params[:item_id] == nil
    item = Item.find(params[:id])
  else
    item = Item.find(params[:item_id])
  end
  link "商品詳細ページ", item_path(item.id)
  parent :root
end

crumb :items_edit do
  link "編集ページ", edit_item_path
  parent :items_show
end

crumb :item_new do
  link "新規投稿ページ", new_item_path
  parent :root
end

crumb :orders do
  item = Item.find(params[:item_id])
  link "購入ページ", item_orders_path
  parent :items_show
end

# crumb :search do
#   item = Item.find(params[:id])
#   link "検索結果ページ", search_items_path
#   parent :root
# end