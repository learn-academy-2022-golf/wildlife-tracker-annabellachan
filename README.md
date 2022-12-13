* Setup 
    ### Create New Rails App
    rails new rails-api -d postgresql -T
    cd rails-api
    rails db:create

This README would normally document whatever steps are necessary to get the
application up and running.
    ### Setup git:
    git remote add origin <github link>
    git branch -M main
    git status
    git add .
    git status
    git commit -m "initial commit"
    git push origin main
    git checkout -b 

Things you may want to cover:
    ### Add Rspec
    bundle add rspec-rails
    rails generate rspec:install


---------------------------------------------------------------------------------

* Story 1: In order to track wildlife sightings, as a user of the API, I need to manage animals.

Branch: animal-crud-actions

Acceptance Criteria

    ✅ Create a resource for animal with the following 
    information: common name and scientific binomial
        $ rails g resource Animal common_name:string scientific_bio:string

    ✅ Can see the data response of all the animals
        def index
            animal = Animal.all 
            render json:animals
         end
        def show
            animal = Animal.find(params[:id])
            render json: animal
        end

    ✅ Can create a new animal in the database
        def create
        animal = Animal.create(animal_params)
            if animal.valid?
                render json: animal
            else 
                render json: animal.errors
            end
        end

    ✅ Can update an existing animal in the database
        def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
            if animal.valid?
                render json: animal
            else    
                render json: animal.errors
            end
        end

    ✅ Can remove an animal entry in the database
        def destroy
        animal = Animal.find(params[:id])
            if animal.destroy   
                render json:animal
            else    
                render json: animal.errors
            end
        end

* Story 2: In order to track wildlife sightings, as a user of the API, I need to manage animal sightings.

Branch: sighting-crud-actions

Acceptance Criteria

    ✅ Create a resource for animal sightings with the following information: latitude, longitude, date
    Hint: An animal has_many sightings (rails g resource Sighting animal_id:integer ...)
    Hint: Date is written in Active Record as yyyy-mm-dd (“2022-07-28")
        $ rails g resource Sighting animal_id:integer latitude:float longtitude:float date:date

    ✅ Can create a new animal sighting in the database
        def index
        sightings = Sighting.all 
        render json: sightings
        end

        def show
        sighting = Sighting.find(params[:id])
        render json: sighting
        end
    ✅ Can update an existing animal sighting in the database
        def update
        sighting = Sighting.find(params[:id])
        sighting.update(sighting)
            if sighting.valid?
                render json: sighting
            else    
                render json: sighting.errors
            end
        end

    ✅ Can remove an animal sighting in the database
        def destroy
        sighting = Sighting.find(params[:id])
            if sighting.destroy   
                render json:sighting
            else    
                render json: sighting.errors
            end
        end

* Story 3: In order to see the wildlife sightings, as a user of the API, I need to run reports on animal sightings.

Branch: animal-sightings-reports

Acceptance Criteria

    Can see one animal with all its associated sightings
    Hint: Checkout this example on how to include associated records
    Can see all the all sightings during a given time period
    Hint: Your controller can use a range to look like this:
    class SightingsController < ApplicationController
    def index
        sightings = Sighting.where(date: params[:start_date]..params[:end_date])
        render json: sightings
    end
    end
    Hint: Be sure to add the start_date and end_date to what is permitted in your strong parameters method
    Hint: Utilize the params section in Postman to ease the developer experience
    Hint: Routes with params


Stretch Challenges
Story 4: In order to see the wildlife sightings contain valid data, as a user of the API, I need to include proper specs.

Branch: animal-sightings-specs

Acceptance Criteria
Validations will require specs in spec/models and the controller methods will require specs in spec/requests.

    Can see validation errors if an animal doesn't include a common name and scientific binomial
    Can see validation errors if a sighting doesn't include latitude, longitude, or a date
    Can see a validation error if an animal's common name exactly matches the scientific binomial
    Can see a validation error if the animal's common name and scientific binomial are not unique
    Can see a status code of 422 when a post request can not be completed because of validation errors
    Hint: Handling Errors in an API Application the Rails Way
    Story 5: In order to increase efficiency, as a user of the API, I need to add an animal and a sighting at the same time.

Branch: submit-animal-with-sightings

Acceptance Criteria

Can create new animal along with sighting data in a single API request
Hint: Look into accepts_nested_attributes_for