SELECT
q1.id,
li.neighbourhood neighborhood,
li.property_type,
li.room_type,
li.bedrooms,
li.bathrooms,
li.accommodates,
li.price,
q1.review_scores_rating,
li.street,
li.review_scores_location

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
WHERE (li.property_type = "Apartment") 
AND (li.bedrooms = 1 OR li.bedrooms = 2) 
AND (li.bathrooms = 1 OR li.bathrooms = 2)