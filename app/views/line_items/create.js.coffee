cart = document.getElementById("cart")
#We choose to overwrite the contents of the document's element
#with the id of "cart"

cart.innerHTML = "<%= j render(@cart) %>"
#We then choose to run the render method on @cart
    #we employ the assistance of the escape_javascript() helper method, aliased as 'j'
#This gets instantiated in the line_items_controller on line 37
#with format.js; a call inside of the respond_to method in the 'create'
# method..

#TODO: Be sure to wrap up the j & render methods and their argument with double quotes!!!
notice = document.getElementById('notice')
if notice
    notice.style.display = "none"