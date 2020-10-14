# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
  ~~ initialized this app with 'gem installl rails' then 'rails new sunday_school', then initiated repo within root directory
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
  ~~ Teacher has_many Assignments
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
  ~~ Assignment belongs_to Teacher
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
  ~~ Teacher has_many Children thorugh Classroom & Classroom has_many Assignments through Children
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
  ~~ Rails offers two different ways to declare a many-to-many relationship between models. I offer the relationship between Assignments and Children which display the simpler form of declaring a many-to-many relationship using the has_many_and_belongs_to association, join table labeled children_assignments
- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
  ~~ **Assignment is being considered for this role
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  ~~ Completed with the EmailValidator as a helper for signups
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  ~~ Class level scope query method in Child Model
- [ ] Include signup (how e.g. Devise)
  ~~
- [ ] Include login (how e.g. Devise)
  ~~
- [ ] Include logout (how e.g. Devise)
  ~~
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  ~~ Link for Facebook Omniauth on Homepage
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
  ~~
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  ~~
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)
  ~~ **Template is getting DRY for use in _form

Confirm:
- [ ] The application is pretty DRY
  ~~
- [ ] Limited logic in controllers
  ~~
- [ ] Views use helper methods if appropriate
  ~~
- [ ] Views use partials if appropriate
  ~~