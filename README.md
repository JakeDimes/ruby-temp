# Lab 6: Final Project - Peer Evaluation Tool

## GRCC Team:

- Jake Queiser
- Mason LaValley
- Bryce Behr
- Layne Chrisman

## [Presentation](https://buckeyemailosu-my.sharepoint.com/:p:/g/personal/queiser_4_buckeyemail_osu_edu/Ealynr_OuFVIpQo1Dky6EXUBwAmzQjrv6KnQ3tqx29xreA)
- Note: Might need to change link or upload slides as a PDF

## Setup Instructions 
1. While in desired folder, clone lab with command `git clone git@github.com:cse3901-2021au-29111/GRCC-Lab6.git`
2. While in GRCC-Lab6 folder, use command `bundle install` to install gems from the Gemfile
3. Run command `rails db:migrate`
4. Run command `rails server`
5. Using the link in the terminal or typing `http://127.0.0.1:3000` into Firefox, view the webpage

## Database Structure
### Account
- fname: String
- lname: String
- dotnum: Integer
- created_at: Datetime
- updated_at: Datetime
- team_id: Integer
- email: String
- password_digest: String

### Ratings
- eval_id: Integer
- rating_student: Integer
- rated_student: Integer
- rating: Integer
- comment: String
- created_at: Datetime
- updated_at: Datetime

### Tasks
- name: String
- team_id: Integer
- due_date: Date
- status: String
- created_at: Datetime
- updated_at: Datetime
- eval_id: Integer

### Teams
- name: String
- count: Integer
- created_at: Datetime
- updated_at: Datetime
