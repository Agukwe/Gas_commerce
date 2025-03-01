(define-private (only-owner)
  (asserts! (is-eq tx-sender CONTRACT-OWNER) (err "Unauthorized")))

(define-public (set-gas-price (gas-type (string-ascii 20)) (price uint))
  (begin
    (only-owner)
    (map-set gas-prices { gas-type: gas-type } { price: price })
    (emit-event gas-price-updated tx-sender gas-type price)
    (ok "Gas price updated")))
