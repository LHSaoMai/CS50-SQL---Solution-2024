# Design Document

By Le Hoang Sao Mai

Video overview: https://youtu.be/RKH2WzFxd80

## Scope

In this section you should answer the following questions:

The database for CS50 SQL includes all entities necessary to track for a lodging booking service. As such, included in the database's scope is:

* customers, including basic identifying information
* lodging, including basic identifying information of all the lodgings supply service
* booking, including all the information of the booking that the customers books (date of check in, date of check out, the lodging id where he will stays). This table also include a soft deletion if the booking was delete or not by the customers
ime at which the submission was made, the correctness score it received, and the problem to which the submission is related
* Prices, including basic identifying information about the prices of each lodging supply. The price can differs over time
* Availabilites, including all the availables date from the lodging supply
* Rating, including for each booking their rating

## Functional Requirements

This database will support:

* Tracking all the bookings from a customer
* Find current price of a lodging and his previous one
* Retrieve all the informations of customer (first_name, last_name, and more if he subscribes)
* Track all the available data for a lodging
* Add a new costomer, booking, or lodging partner in our database
* Can delete a booking with soft deletion in the booking table

Note that in this iteration, the system will not support tacking modification of booking.

## Representation

Entities are captured in SQLite tables with the following schema.
![The schema](diagram.png)

### Entities

The database includes the following entities:

### Entities

#### lodging
The lodging table includes:

* `id`, which specifies the unique ID for the lodging as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the lodging's name as `TEXT`
* `region`, which specifies the lodging's region as `TEXT`
* `nbr_rooms`, which specifies the number of rooms for a lodging as NUMERIC (because we could have for example 2.5 rooms)
* `enter_data`, which specifies the date where this lodging become our partner
* `exit_date`, if applies, it specify the date when the lodging is not anymore our partner


#### customers
The customers table includes:

* `id`, which specifies the unique ID for the customer as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `first_name`, which specifies the customer's first name as `TEXT`
* `last_name`, which specifies the customer's last name as `TEXT`
* `username`,  if applies, it specify the username  when the customer create an account as `TEXT`
* `enter_data`, if applies, it specify the date when the customer create an account as `TEXT`
* `password`, if applies, it specify the password  when the customer create an account as `TEXT`


#### prices
The prices table includes:

* `id`, which specifies the unique ID for the price as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `lodging_id`, which specifies the lodging_id as `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied.
* `price`, which specifies the price apply to the lodging, as `NUMERIC`
* `date`, which specifies the date in which the price is apply for the lodging, as `TEXT` (because, the price can change day by day)

#### booking
The booking table includes:

* `id`, which specifies the unique ID for the booking as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `customers_id`, which specifies the customer_id of the booking as `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied.
* `lodging_id`,which specifies the lodging_id of the booking as `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied.
* `booking_checkin`, which specifies the date in which the client will check-in in the lodging, as `TEXT`
* `booking_checkout`, which specifies the date in which the client will check-out in the lodging, as `TEXT`
* `price_id`, which specifies the customer_id of the booking as `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied.
* `nbr_people`, which specifies the number of people for this booking as `INTEGER`
* `delete`, which specifies if the booking was deleted or not. Here we apply soft deleting as `INTEGER`, with a default option of 0.


#### ratings
The prices table includes:

* `id`, which specifies the unique ID for the price as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `lodging_id`, which specifies the lodging_id as `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied.
* `price`, which specifies the price apply to the lodging, as `NUMERIC`
* `date`, which specifies the date in which the price is apply for the lodging, as `TEXT` (because, the price can change day by day)


#### availables
The prices table includes:

* `id`, which specifies the unique ID for the availability of each lodging as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `lodging_id`, which specifies the lodging_id as `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied.
* `date`, which specifies the datem as `TEXT`
* `available`, which specifies the available for the lodging given the date, as `TEXT`


### Relationships

The below entity relationship diagram describes the relationships among the entities in the database.

![ER Diagram](schema2.png)

As detailed by the diagram:

* One customer is capable of making 0 to many bookings.
* One lodging could be associated with 0 to many bookings.
* One rating is associated with one booking and vice versa.
* A lodging is associated with 0 to many bookings. However, a booking is only associated with 1 lodging.
* A lodging can be associated with 1 to many availabilities.
* A lodging is associated with 1 or many prices. Indeed, depending of the season, the lodging supplier can change it prices.

## Optimizations

Per the typical queries in `queries.sql`, it is common for users of the database to access all bookings booked by any particular customer. For that reason, indexes are created on the `first_name`, `last_name` of `customer` table and `customer_id` of  `booking` table. Given that, we could also retrive the lodging name of those booking, so indexes are created on the `name`of `lodging` table.

Similarly, it is also common practice for a user of the database to concerned with viewing all the ratings of a particular lodging. As such, an index is created on the `booking_id`,`lodging_id` columns
on the `ratings` table.

Lastly, it is also common practice for a user of the database to looking at all the avaibilities of a particular lodging. As such, an index is created on the `lodging_id` columns
on the `availables` table.

## Limitations
This current database does not account for the information of other people in the case of group bookings. It only stores the information of the primary person who made the booking.
Additionally, the database does not track the history of booking modifications.
