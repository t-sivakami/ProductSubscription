 ======================
Product Subscription App
======================
Workflow:

- There is a website where the home page is a landing page with a call to action "subscribe"

Case1:
- Upon clicking "Subscribe" user will be taken to  signUp
- Once signedIn, the user will be redirected to payment page to fill card details.
- Upon successful payment, products page will be shown.
- Adding products to card and payment will be worked upon.

Case2: (to check workflow if payment is not done after signUp)
- Once signedIn, the user will be redirected to payment page to fill card details.
- Click on "products" link from header. 
- User will be asked to "Subscribe"
- Upon clicking "subscribe" button , user will be taken to payment page.
- Upon successful payment, products page will be shown.

Case3:
- Once loggedIn user can add products ( considering admins ). This has been implemented for testing purpose.
- Role based authentication will be implemented later.

Notes
- Implemented user signup, SignIn, Edit user Account, Payment, products workflow pages.
- Test Stripe account has been used for payment workflow for now.
- Application is built to work in development environment in windows.
- Mailer activation is disabled since considering to configure in local environment
- Javascript validations will be worked upon if timeframe given for 1 more day.
- Need 1 more day to deploy in cloud platform like Heroku to test in production

- Run below steps to configure the application in local.
1. Unzip
2. bundle install
3. rails db:create
4. rails db:migrate
5. rails s
