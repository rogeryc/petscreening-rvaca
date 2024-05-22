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
    - Can list pets

- Add New Pet Features
    - From the list, click to view the pet
    - From the list, click to open a form to Edit the pet
    - Submitting the form should save the Pet
    - Add ability to give the pet a weight
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
