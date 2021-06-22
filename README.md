# Comic & Store web application for PinkWug


To get this application running you need:

* Ruby 2.6.3

* Rails 6.0.3.7


## A work in progress
I started working on this project with the permission of PinkWug to practice what I learned in Noble Desktop. 

## Previews:
### Desktop:
![DesktopPreview](https://user-images.githubusercontent.com/43931665/121565216-46a9de80-c9ea-11eb-8c76-8496ec8d44e7.png)
### Mobile:
![MobilePreview](https://user-images.githubusercontent.com/43931665/121565399-693bf780-c9ea-11eb-85ca-db7b4046c744.png)
### Admin:
![AdminPreview](https://user-images.githubusercontent.com/43931665/121558341-99cc6300-c9e3-11eb-887a-c2c4aa00ca9d.png)
### The basic relationship map for future implementation: 
![SQL - Pink Wug](https://user-images.githubusercontent.com/43931665/121552046-2411c880-c9de-11eb-8eda-647e53827834.png)

## To-Do:
### Back End
- [ ] SEO
  - [x] Meta tags
  - [ ] Breadcrumb
  - [ ] Sitemap
- [x] Search
  - [x] Search by title, description, keywords or transcript
  - [ ] WhiteSpace.js not displaying properly on search
- [ ] Author Comments/Announcements
- [ ] Comic navigation doesnt use turbolinks
- [ ] Cannot read property 'remove' of null in comicNav.js when using archive links
- [ ] Turbolinks history nav opens menu bar
- [ ] Tests
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
- [ ] reviews
- [ ] Search

### Later Consideration
- [ ] Image processing for screen optimized crop
- [ ] OpenGraph 
- [ ] Twitter Card meta_tag