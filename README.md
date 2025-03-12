# README

# Samovar API - Backend Service

A Ruby on Rails API backend for the Samovar tea subscription service, providing endpoints to manage tea subscriptions.

# API Overview
This Rails API serves as the backend for the Samovar tea subscription admin portal, handling subscription data retrieval, detailed views, and subscription management.

# Endpoints
* Retrieve all subscriptions
GET/api/v1/subscriptions
* Retrieve all subscriptions, sorted by price
GET/api/v1/subscriptions?sort=price
* Retrieve detailed information for a specific subscription
GET/api/v1/subscriptions/:id
* Delete a subscription
DELETE/api/v1/subscriptions/:id

# Setup Requirements & Technical Stack

* Ruby 3.2.2 
* Rails 7.1.4.1 
-
* Ruby on Rails 
* PostgreSQL database
* Custom JSON serializers for API responses
* RSpec for testing

# Testing
The application uses RSpec for testing.  

Controller Implementation
The Api::V1::SubscriptionsController handles all subscription-related requests with the following actions:

* index: Retrieves all subscriptions, with optional sorting by price
* show: Retrieves detailed information for a specific subscription, including related teas and customer information
* destroy: Removes a subscription from the database

# Models and Associations
The Subscription model has associations with:

Customer (belongs_to)
Teas (has_many through a join table)







# STARTER REPO DETAILS AND PROJECT SPEC

Things we'll be looking for:
A strong understanding of Rails, React and best practices
BE: Ability to create restful routes
BE: Demonstration of well-organized code, following OOP
BE: Test Driven Development
FE: An understanding of basic usability practices and standards
FE: A clear hierarchy of information
Clear documentation
Your ability to prioritize for MVP
Clean, well factored code
Try to limit your total time to approximately 7-8 hours each side of the stack. We recommend starting with the BE, and then moving onto the FE, but you are welcome to design your own workflow. Prioritize what is important to completing MVP and demonstrating your capabilities as a developer.

Tea Subscription Service
You will create a full stack application for a Tea Subscription Service, including a Rails API and a React front end. You do NOT need to deploy this app.

Rails API
Feel free to use this starter repo with RSpec and other common gems already configured.

Requirements:
At a minimum, you must create:

- An endpoint to get all tea subscriptions
- An endpoint to get info about one subscription, including the tea(s) involved and what customer(s) is subscribed or has been in the past (if cancelled)
- An endpoint to cancel a specific subscription

Beyond the base requirements, include any additional endpoints you'd like, but be mindful of your time. You don't need to go overboard, consider what might be necessary to achieve MVP so that this API is easy to understand and consume by a Frontend Developer.

If you are looking for a stretch option, you can consume this API for tea product information: Spoontacular API

Data Details
Note: The below data outlines are meant to be a guide for data details you may use in the application. If you want to change or include more information please do so. The data below does not need to be a direct mapping to your database schema (i.e. there might be more tables involved). Keep in mind there are many ways to implement this at a database level. Just be sure to choose an option that makes sense to you and reflects how you are assuming the tea subscription service functioning. You can make business assumptions. Using fake data in your application is okay.