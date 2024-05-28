# Ruby on Rails Assesment

Thank you for taking this assessment. We will have you work with a sample Pet Adoption Service.

We'll outline below the current features and ask you to implement some new information on our pets.

**The intent here is to get as far as you can within 2-4 hours. Please don't feel like you need to spend anymore time on it.**

There are no tests currently, you may choose MiniTest or Rspec and create tests as you develop the new features. We'll also ask you to use an external API to use one of our
pets and get more information.

We will run the tests locally on our machines. Please provide any documentation in the README you think might be needed for us to be able to follow the steps to do that.

## Steps

1. Clone this repo
2. Navigate to the project directory
3. Run migrations and seeds.
4. Create a personal Repo where you can use our clone as the main branch
5. Create a feature branch for you to submit changes

## Requirements

- Current features
    - Can create a pet
        - Name
        - Kind
        - Breed
    - Can list, view, edit and update the pet

- Add tests to confirm the current features
- NOTE: For the following add tests to confirm funcationality
- Add New Pet Features
    - Add the ability to give the pet a weight
- Add New Owner Feature
    - Add a model for owners with basic information
    - Make sure an owner can have many pets
    - We don't need a FrontEnd for this, just be able to do it via the Rails Console
- New API Feature
    - Use https://dogapi.dog/
    - given one of our pets Breeds, choose some more information we may want
        - How would you store the extra information
        - Add the necessary code to store the information you choose to the database
    - Add ability for the Owner to pick a pet and get breed information about that pet

### **Evaluation Criteria**

1. **Code Quality:** Maintainable, well-structured code following Ruby and Rails best practices.
2. **Functionality:** The features you choose to finish should be functional.
3. **Testing:** Extensive test coverage ensures the application's reliability and stability.
4. **Documentation:** Clear and concise documentation covering setup instructions, usage guidelines, and any notable design decisions.
5. **Adherence to Best Practices:** Consistent use of Rails conventions, adherence to RESTful principles, and implementation of secure coding practices.

### Submitting your assessment
1. Push your changes to the feature branch you created in the setup
2. Share your personal repo with us so we can take a look
3. After you submit your solution, we'll review it and talk it over with you.


### How to test the assessment result

## Test the app

1. Clone the repo and checkout to the branch `f-rvaca`run `bundle install`
2. Run `bundle install`
3. Create and seed the database
4. Run the server and navigate to a pet from index view. In the show view, hit the link "Add breed info" and check the info wasn't loaded.
5. Edit a pet and change the breed to "Caucasian Shepherd Dog" and hit the same link again. Check there's a new section for breed info.

## Run rspec tests

1. Run `rspec` from console and verify there aren't errors.

### TODO's

After finishing some tasks in the required time, there are some pending tasks to accomplish, in order to have a better and more secure code:

- Add model tests to BreedInfo model (similar to Pet and Owner)
- Add system tests to check some stuff like: 'When hitting Add Breed Info there's an alert if no info is found'
- Refactor the BreedData service to save data in other place and keep single responsability principle
- Improve how to get info from Dog's breeds API and how to save the desired data
- Define what attributes are required or have some other restrictions, like lenght or numericality