# Comic & Store web application for PinkWug


To get this application running you need:

* Ruby 2.6.3

* Rails 6.0.3.7


## A work in progress
I started working on this project with the permission of PinkWug to practice what I learned in Noble Desktop. 

## Previews:
### Desktop:
https://user-images.githubusercontent.com/43931665/123495592-62200680-d5f2-11eb-9a7e-cf75fc9ef305.mp4

### Admin Dashboard:
https://user-images.githubusercontent.com/43931665/122866855-a52e6100-d2f6-11eb-9113-662be519c5b7.mp4


## To-Do:
### Back End
- [ ] SEO
  - [x] Meta tags
  - [ ] Breadcrumb
  - [ ] Sitemap
- [x] Search
  - [x] Search by title, description, keywords or transcript
  - [x] WhiteSpace.js not displaying properly on search
- [ ] Author Comments/Announcements
- [ ] Comic navigation doesnt use turbolinks
- [ ] Turbolinks history nav opens menu bar
- [x] Root path doesnt update after Strip.last.id changes
### Tests
- [x] Models 
  - [x] validates presence of title, image, transcript
- [x] Admin CRUD
  - [x] Create
  - [x] Read
  - [x] Edit/Update
  - [x] Destroy
- [x] Views
  - [x] Show
  - [x] comic navigation
  - [x] Archive
    - [x] Default view
    - [x] View toggle
    - [x] Title & Date toggle
### Front End
- [x] Archive
  - [x] Date format
  - [x] Mobile Responsive
  - [x] Toggle gallery/details button
  - [x] Filter by dates and titles
    - [x] Titles Ascending
    - [x] Titles Descending
    - [x] Date Ascending
    - [x] Date Descending
  - [x] Different icon for ascending and descending order
  - [x] Remove title/date class when the other is clicked
  - [x] Whitespace.js doesn't trigger when loading from archive
- [ ] View
  - [ ] Author Comments
  - [x] Fix Patreon logo not displaying properly on small screens

### e-commerce
- [ ] costumers
- [ ] products
- [ ] carts
- [ ] orders
- [ ] line_items
- [ ] Search

### Later Consideration
- [ ] Image processing for screen optimized crop
- [ ] OpenGraph 
- [ ] Twitter Card meta_tag
