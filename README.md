# Database Structure

## 1. Contacts Table

This table will store information about individual contacts.

| Column Name   | Data Type | Description                                    |
| ------------- | --------- | ---------------------------------------------- |
| id            | Integer   | Primary key (automatically added by Rails)     |
| first_name    | String    | First name of the contact                      |
| last_name     | String    | Last name of the contact                       |
| email         | String    | Email address of the contact                   |
| phone_number  | String    | Phone number of the contact                    |
| address       | String    | Physical address of the contact                |
| category_id   | Integer   | Foreign key to the categories table            |
| created_at    | DateTime  | Timestamp of when the contact was created (auto)|
| updated_at    | DateTime  | Timestamp of when the contact was last updated (auto) |

## 2. Categories Table

This table will store the different categories you want to assign to contacts, such as "Family," "Friends," or "Work."

| Column Name | Data Type | Description                                      |
| ----------- | --------- | ------------------------------------------------ |
| id          | Integer   | Primary key (automatically added by Rails)       |
| name        | String    | Name of the category (e.g., "Family," "Friends") |
| created_at  | DateTime  | Timestamp of when the category was created (auto) |
| updated_at  | DateTime  | Timestamp of when the category was last updated (auto) |

## Associations

- Each contact belongs to a category.
- Each category can have many contacts.

# Key Points for Implementation

- **Foreign Key**: The `category_id` column in the contacts table is a foreign key that references the categories table. This allows each contact to be associated with a specific category.

- **Associations in Models**: You need to set up the appropriate associations in your Rails models:
    - The `Contact` model should have a `belongs_to :category`.
    - The `Category` model should have a `has_many :contacts`.

