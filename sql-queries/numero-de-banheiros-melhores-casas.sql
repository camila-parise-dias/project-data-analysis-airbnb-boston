SELECT
li.property_type,
COUNT(q1.id) total_property_type,
COUNT(CASE WHEN bathrooms = 0 THEN 1 END) 0_bathroom,
COUNT(CASE WHEN bathrooms = 1 THEN 1 END) 1_bathrooms,
COUNT(CASE WHEN bathrooms = 2 THEN 1 END) 2_bathrooms,
COUNT(CASE WHEN bathrooms = 3 THEN 1 END) 3_bathrooms,
COUNT(CASE WHEN bathrooms = 4 THEN 1 END) 4_bathrooms
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
GROUP BY li.property_type
ORDER BY total_property_type DESC