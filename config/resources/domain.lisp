(in-package :mu-cl-resources)

(defparameter *max-group-sorted-properties* nil)

(define-resource hotel ()
  :class (s-prefix "ext:Hotel")
  :properties `((:name :language-string-set ,(s-prefix "dct:title"))
                (:description :language-string-set ,(s-prefix "dct:description"))
                (:test :language-string ,(s-prefix "dct:test")))
  :resource-base (s-url "http:/test-url.be/hotels/")
  :on-path "hotels"
)
