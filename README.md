#Reeder

Book, Article, Magazine, etc. Reading Tracking App

#Technologies Used

* Google Books API
* iOS 7
 * Core Data
* TODO

#Design

###Reading Log View
* Table view of reading logs.
* Cell image should be a thumbnail of the cover of the item read if available.
* Cell should have the main detail text be the title of the item read.
* Cell should have the sub detail text be the date and time (8/7/14 10:32 PM) of the item read.
* More details to include if possible: length of time read, chapters read, etc.?
* Reading logs can be deleted from the table view after confirming an alert of some kind (swipe left to delete only)
* The table view should be searchable (search bar above table view)
 * Reading logs should be searchable against title, author, tags, notes and any details contained within the actual reading item associated with the log
* New logs can be entered via a "+" button in the right bar button or a "<start>" button in the [left|right] bar button. The "+" button will segue modally to the Log Creation View, and the "<start>" button will segue modally to the Log Start View.
* The navigation bar will display "Reading Log" as the title.
* Existing logs can be selected by tapping on the row. This will push segue to the Log Detail View.
* The table view of reading logs can be sorted in many different ways, all asc/desc toggleable: date (default), length of log, by reading item title, by reading item author, page count of log, type of log (book, article, e-book, magazine, etc.)
* Table view sections should be created based on the table sorting currently applied. For example, if you are sorting by reading item title, each section should be the title of the reading item of the logs.
* The reading log that is currently active will always appear at the top of the table.
* There should be a log quickstart button of some kind that will modally display a list of the most recent logs for the user to choose from that will then use that log as a baseline to start the log. Possibly just asking the user for a starting page, or something like that.
* There should be a quick way to mark the current log as /COMPLETED/
* The log quickstart/<start> button should be disabled if a log is already outstanding.
* Stretch features:
 * There should be a way to get from a reading log item cell to the reading item itself (info disclosure or a swipe left item besides delete?)

###Reading Log
* Many-to-One relationship with ReadingCollection Items (books, ebooks, magazines, newspapers, articles from websites, etc)
* Date and Time of Start
* Date and Time of End
* Length of Log (derived from start and end)
* Notes
* Page Start (or % for Ebooks?)
* Page End
* Number of pages (% of item) (derived from page start and end)
* Chapters Read
* Chapters Partially Read
* Tags
* Rating (1-5 stars)

###Reading Collection Item
* Types:
 * Book
 * EBook
 * Newspaper
 * Magazine
 * Periodical
 * Website
 * Article from [Newspaper|Magazine|Periodical|Website] 
* One-to-Many relationship with reading logs
* Title
* Website (if applicable)
* Published Date (suited to the type)
* Publisher
* Photo (if applicable, and suited to the type) (if entered from a web url, should store the url and /maybe/ cache.)
* Photo Thumbnail (definitely save/cache this)
* Page count (if applicable, and suited to the type)
* Tags
* Notes
* Date Added to Collection
* Rating (1-5 stars)
* Have a Subscription? (if applicable)

###Log Creation View
* The log creation view will allow the user to enter the various details to create the complete reading log manually.
 * Start Date and Time
 * End Date and Time
 * Ability to choose a Collection Item or Create a New one (will modally display the Reading Collection Item Creation View - see below)
 * Notes
 * Tags
 * Page Start
 * Page End

##Log Start View
* The log start view will allow the user to enter a limited amount of info to just get the log started, so the user can start reading and come back later to finish the log.
 * Reading Collection item to log on and the page start number. That should really be it.

###Log Detail View
* The log detail view will display all the various attributes of each reading log.
* The user will be able to edit every detail.

###Reading Collection View
* Table of reading collection items (books, ebooks, articles, magazines)
* Many features present on the reading log table will carry over to this table view.
* Deleting a collection item will have ramifications on deleting all the associated log entries as well. The user should be informed of the number to be deleted, and the user should have to confirm twice the delete.

###Reading Collection Item Creation View
* The reading collection item creation view will allow the user to enter the varfious details to create the collection item manually.

###Reading Collection Item Detail View
* The reading collection item detail view will display all the various attributes of each collection item.
* The user will be able to edit every detail.

###Additional Views and Features (Stretch Goals?)
* Collection Item detail generation via scan (stretch) of isbn bar code, or entering it manually (good start), or searching via text/keywords/tags, etc.
 * Will use combination of Google Books, OpenLibrary and possibly other web APIs to search for info and images.
* Recommended reading based on your reading habits
* Reading stats in chart form
* Goals Setting and Tracking
* Friends/Friend Feed and Global Tracking and Stats (way stretch :) )
* Ability to read/create reviews/discussions for Collection Items.
