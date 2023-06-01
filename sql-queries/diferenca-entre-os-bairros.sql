SELECT
q1.id,
li.neighbourhood neighborhood,
li.price,
q1.review_scores_rating,
ca.date,
ca.available
FROM
(SELECT
id,
review_scores_rating,
number_of_reviews
FROM listing_airbnb_boston_ready
WHERE review_scores_rating >= 80
ORDER BY review_scores_rating DESC, number_of_reviews DESC) q1
JOIN listing_airbnb_boston_ready li
ON q1.id = li.id
JOIN calendar_airbnb_boston_ready ca
ON q1.id = ca.listing_id
WHERE (li.property_type = "Apartment") 
AND (li.bedrooms = 1 OR li.bedrooms = 2) 
AND (li.bathrooms = 1 OR li.bathrooms = 2) 
AND ca.available = "false"