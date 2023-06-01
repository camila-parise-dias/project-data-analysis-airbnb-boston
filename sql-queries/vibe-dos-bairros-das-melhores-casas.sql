SELECT
q1.id,
li.neighbourhood neighborhood,
li.neighborhood_overview
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
ORDER BY neighbourhood