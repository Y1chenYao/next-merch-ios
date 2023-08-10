# next-merch-ios

### Merch ordering app

Usually in clubs, it is super hard to keep track of the merch that people want. 

In this app, a user can post a merch with price, description, pickup location, and pickup time in the marketplace. Other users can choose to pre-order how many merch they want to buy and tag along their Venmo ids. 

The sellers will manually check off the orders if he/she receive the money on Venmo, and the buyers can see the orders updated as “payment verified”. Sellers will also manually check off the orders that have been picked up by the buyers in person.

PS: The app idea is inspired when I was selling matcha cookies made by my friends in the project team and I. :)

### Demo
Watch the video demo here: https://www.youtube.com/watch?v=GEMphaXigss

![Component 1](https://github.com/Y1chenYao/next-merch-ios/assets/68068854/374e8fc8-27d0-4939-ac8c-d12bfddea06f)

### Backend API
Repo can be found here: https://github.com/cap337/hack-challenge_SP2023-

|request|endpoint |header/request body|return|
|---|---|---|---|
|GET |/merch|`none`|info of all merch|
|GET| /merch|`{<merch_id>}`|info of one specific merch|
|GET| /merch|`{<seller_id>}`|info of all merch by a seller|
|POST| /merch|`{all fields except for id of merch db}`|create one new merch in merch database |
|GET| /order|`none`|get all orders (for testing purposes)|
|GET|/order|`{<order_id>}`|get one order by order_id|
|GET|/order|`{<merch_id>}`|get all orders for one merch|
|GET| /order|`{<buyer_id>}`|get all orders for one buyer|
|POST| /order|`{all fields except for id}`|create one new order in order database, if pickedup, if payment received defaulted to be false|
|POST| /order|`{<order_id>, <if pickedup>, <if payment received>}`|This endpoint is used by sellers to update the 2 status of order. If one or both boolean values are missing in the json body, still accept it without raising error.|
|DELETE|/order|`{<order_id>}`|delete order by order_id|
|POST |/user|`{<name>,<password>}`|create a new user and return the json with user_id|
|GET| /user|`{<user_id>}`|return the user name (probably not password)|
|GET| /user|`{<name>,<password>}`|verify if the user exists in the database|






