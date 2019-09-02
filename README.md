# StellaMcCartney
Shopping app example for brand Stella McCartney.

**Development Process**

- Initially I wrote the Service class to parse the API endpoints, analysed the structure, and created the Categoies View Controller with a collectionView, in which each cell represented a category. Uppon tap on a cell, part of the Url stored in constants is passed to the Service class function, in order to fetch products list.
- I handled connectivity errors by presenting alerts.
- The product list is shown in a collectionView with 2 rows, and each product contains a thumbnail image, the product title, the full price and the discount price if present.
- I wrote the Product View Model to handle logic regarding the presence or absence of discount price, check for HTML tags and check if modelNames is nil, because in this case, the microCategory would be used as title. This way the product cell doesn't appear without title.
- Then, on product tapped, the Detail View Controller is presented, and the product's code8 is passed in order to fetch the details, and show on interface.
- For the image carousel, I chose to create a custom UIView implementing a horizontal collection, and for the image indicator, other similar custom view with round cells, each "dot" representing the current image showing.
- When a new cell appears in Photo Carousel, a notification is sent to PhotoIndicator, and the same index is selected.
- When the details are fetched in Detail View Controller, a notification is sent to both carousel View and indicator View to populate the collection views with the count of items in array. The data parsed is handled by ProductDetailViewModel, where it's prepared by checking for HTML tags, missing fields and different prices.
- Also in ProductDetailViewModel, the urls are assembled with folderIdentifier, defaultCode10 and resolution. It also checks if there's any .gif image among the images, and discard it. Also, checks for duplicated images, and checks if there are no images returned inn given resolution, checks for images in smaller resolutions.
- All images are cached to reduce network overhead.
- Finally, I tried writing some unit tests using XCTest. I had never written unit tests before, but I am very interested in learning about this tool. For now, I wrote a basic structure.
- Overall I was very happy with this project, it has been fun to develop, I gave a personal touch, presenting a UI structure that I enjoy, and I looked for inspiration on Stella McCartney's website, and The Outnet app.
