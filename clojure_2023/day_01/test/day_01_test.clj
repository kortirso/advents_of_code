(ns day-01-test
  (:require day-01
            [clojure.test :refer [deftest is testing]]))

(deftest ^{:task 1} read-file-test-1
  (testing "Read test file"
    (is (= 142 (day-01/calibrate "./data/test_data.txt")))))

(deftest ^{:task 1} read-file-1
  (testing "Read file"
    (is (= 56108 (day-01/calibrate "./data/data.txt")))))

(deftest ^{:task 2} read-file-test-2
  (testing "Read test file"
    (is (= 281 (day-01/calibrate-with-symbols "./data/test_data_2.txt")))))

(deftest ^{:task 2} read-file-2
  (testing "Read file"
    (is (= 55652 (day-01/calibrate-with-symbols "./data/data_2.txt")))))
