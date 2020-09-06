# Seo-central
Seo-Central provides an API interface to manage company information on multiple platforms.



## Built With

- Ruby, Rails
- Postgresql
- Faraday Gem 


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

To run this project, you will need to have `Rails`,`Ruby` and `PostgreSql` already installed locally

### Setup
`Clone the project and cd into the directory`

### Install
run `bundle install` to install all the dependencies of the project

run  `rails db:create` to create a new database for the project

run `rails db:migrate` to get the migration schema setup in the new tables in the database. 

create a `.env` file at the root of the application and provide a key to the variable `API_KEY=`

### Usage
run `rails s` to get the project running

### Venues

This represents a location about which we can store data about.
- we can see all locations by calling  `GET: /venues` 
- Data can also be posted to `POST: /venues` to add a new location

**respons example**
```bash
{
    "id": 1,
    "name": "kfc ok",
    "primary_address": "no 35 east space X",
    "other_address": null,
    "website": "joker.com",
    "phone": "08120522261",
    "lat": "9.305438",
    "lng": "7.066177",
    "closed": true,
    "hours": null,
    "category_id": "2001",
    "created_at": "2020-08-30T22:52:59.639Z",
    "updated_at": "2020-08-31T22:58:51.725Z"
}

```

### Platforms
These represent the platforms we are able to disburse out information about a venue to.

### Platform and Venue

Platforms and venues have a Many - Many relationship. This means for any given venue we can get all the platforms associated with it and inversely a platform is associated with alot of venues.
This can be queried as:

```bash
venue = Venue.first
venue.platforms   // platforms on which the venue information is shared


platform = Platform.first
platform.venues  //venues or businesses that are using the platform.
```

### Public Info

  we ofter would like to know what we look like publicly to better improve the image of a business or venue to do that, there are a couple of endpoints

  ### Info on platform X

  `GET: /venues/venue_id/platform/platform_id`
  
  Calling the above url gives us an idea of what a venue/business looks like on a given platform.

  **keys**

  `venue_id:`

  ```bash
   This is the `id` of the the venue we are interested in
   ```
  `platform_id:`

  ```bash
   This would be the identifier of the platform with want example would be `platform_a' 
  ```

  ### Updating Public info
  `/venues/venue_id`

  This provides us an endpoint to update the data we have locally.
  In addition it also calls a service which would take care of updating the platforms that are related to a given venue.

  If you'd rather do the public update manually at a chosen time, you can invoke this by callng

  `UpdatePlatformService.new(venue_id).update_platforms`

  This would require the id of a venue to be initialized and the `update_platform` method would handle the rest.

  An example of this would be.

  ```bash
  venue = Venue.first
  update_service = UpdatePlatformService.new(venue.id)
  update_service.update_platforms
  ```

## Authors

👤 **Author**

- Github: [@SunnyAsar](https://github.com/SunnyAsar)
- Linkedin: [Sunny Asar](https://www.linkedin.com/in/sunnyasar)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/SunnyAsar/seo-central/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.****