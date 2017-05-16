# README

Build a simple bidding website. You can use either Rails or Node.js, you get 10% bonus if you use Node.js / Express.js. And, an extra 10% if you write your front-end with React. If you're writing the application in Node.js, you can ignore user authentication and all related requirements.

There are 2 tracks, A and B. The B track is meant to be friendlier for the Node.js version of the app, but may have some unknowns.

Part 1A (30%):
Implement Create, New, Show & Index actions for Auction
Implement Bids for Auctions
Part 1B (30%):
Implement Part 1A as a JSON API
Part 2A (30%):
Write tests with RSpec for the Auction Controller

At least two test cases per action
Write tests with RSpec for the Bid Controller

At least two test cases per action
Add user authentication and disallow users to bid on their own auctions

Add a JavaScript library for the date selector (any library will do)

Part 2B (30%):
Write a separate front-end client for your app using AJAX to make requests to your API
Do not forget about CORS.

Part 4 (15%):
Add support for states to the auction model: draft / published / reserve met / won / canceled / reserve not met.
Use FSM with rails and add events to the state machine that trigger going from one state to another.
For the Node.js version, you will have to use your own logic to implement state changes.
Implement the ability to publish an auction by having a "publish" button on the auction show page. This should only be visible to the creator of the auction.

Part 5 (15%):
Validate that bid prices must by higher than the current price of the auction. Set the current price to highest new bid. For example, when the user creates an auction, it should default at a price of $1 and then if a user creates a bid with $10 then the current price for the auction should become $10, if another user tries to bid $5, he/she should get a validation error.
Display users' full names beside their bids
Make a page to list all the auctions that someone has made bids on them, it should be visible to logged in users only

Part 6 (15%):
Add the ability to make Auctions watchable (similar to favourites)
Use an eye-like icon to toggle an auction being watched
Add a view to list all watched auctions with their title and state

Part 7 (10%):
Trigger moving auctions to "reserve met" state when a bid happens to be above the reserve price.
