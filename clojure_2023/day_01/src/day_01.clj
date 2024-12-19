(ns day-01)

(defn readFile [file]
  (with-open [rdr (clojure.java.io/reader file)]
    (reduce conj [] (line-seq rdr))))

(defn calibrate-line [s]
  (+
    (* 10 (first s))
    (last s)))

(defn find-match-digits [s]
  (re-find #"1|2|3|4|5|6|7|8|9" s))

(defn find-match-substring [s]
  (re-find #"one|two|three|four|five|six|seven|eight|nine|1|2|3|4|5|6|7|8|9" s))

(defn find-match-reverse-substring [s]
  (re-find #"eno|owt|eerht|ruof|evif|xis|neves|thgie|enin|1|2|3|4|5|6|7|8|9" s))

(defn string-to-number [s]
  (cond (or (= s "eno") (= s "one") (= s "1")) 1
        (or (= s "owt") (= s "two") (= s "2")) 2
        (or (= s "eerht") (= s "three") (= s "3")) 3
        (or (= s "ruof") (= s "four") (= s "4")) 4
        (or (= s "evif") (= s "five") (= s "5")) 5
        (or (= s "xis") (= s "six") (= s "6")) 6
        (or (= s "neves") (= s "seven") (= s "7")) 7
        (or (= s "thgie") (= s "eight") (= s "8")) 8
        (or (= s "enin") (= s "nine") (= s "9")) 9
        :else 0))

(defn find-digits [s]
  (list
    (string-to-number (find-match-digits s))
    (string-to-number (find-match-digits (clojure.string/reverse s)))))

(defn find-symbolized-digits [s]
  (list
    (string-to-number (find-match-substring s))
    (string-to-number (find-match-reverse-substring (clojure.string/reverse s)))))

(defn calibrate [file]
  (reduce +
    (map calibrate-line
      (map find-digits
        (seq
          (readFile file))))))

(defn calibrate-with-symbols [file]
  (reduce +
    (map calibrate-line
      (map find-symbolized-digits
        (seq
          (readFile file))))))
