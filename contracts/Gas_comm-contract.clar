(define-private (only-owner)
  (asserts! (is-eq tx-sender CONTRACT-OWNER) (err "Unauthorized")))

(define-public (set-gas-price (gas-type (string-ascii 20)) (price uint))
  (begin
    (only-owner)
    (map-set gas-prices { gas-type: gas-type } { price: price })
    (emit-event gas-price-updated tx-sender gas-type price)
    (ok "Gas price updated")))
(define-public (purchase-gas (gas-type (string-ascii 20)) (amount uint))
  (let ((price (unwrap! (map-get? gas-prices { gas-type: gas-type }) (err "Gas type not found"))))
    (let ((cost (* amount price)))
      (begin
        (asserts! (>= (stx-get-balance tx-sender) cost) (err "Insufficient funds"))
        (map-set gas-balances { user: tx-sender }
                 { balance: (+ (get balance (unwrap! (map-get? gas-balances { user: tx-sender }) { balance: u0 })) amount) })
        (emit-event gas-purchased tx-sender amount gas-type)
        (ok "Gas purchased successfully")))))

(define-public (withdraw-gas (amount uint))
  (let ((balance (unwrap! (map-get? gas-balances { user: tx-sender }) (err "No balance found"))))
    (begin
      (asserts! (>= (get balance balance) amount) (err "Insufficient balance"))
      (map-set gas-balances { user: tx-sender } { balance: (- (get balance balance) amount) })
      (emit-event gas-withdrawn tx-sender amount)
      (ok "Gas withdrawn successfully"))))
(define-public (transfer-ownership (new-owner principal))
  (begin
    (only-owner)
    (define-constant CONTRACT-OWNER new-owner)
    (ok "Ownership transferred successfully")))

(define-read-only (gas-type-exists (gas-type (string-ascii 20)))
  (is-some (map-get? gas-prices { gas-type: gas-type })))

(define-read-only (list-gas-types)
  (map-get-keys gas-prices))
