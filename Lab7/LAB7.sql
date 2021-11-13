--- 2
---A
CREATE ROLE accountant;
CREATE ROLE administrator;
CREATE ROLE support;

GRANT ALL PRIVILEGES ON accounts to accountant;
GRANT ALL PRIVILEGES ON customers to administrator;
GRANT ALL PRIVILEGES ON transactions to support;

---B
CREATE USER Madina;
CREATE USER Aray;
CREATE USER Aidana;

GRANT accountant TO Aray;
GRANT adminstrator TO Madina;
GRANT support TO Aidana;

---C
CREATE ROLE role_manager CREATEROLE;
GRANT role_manager to Madina;

---D
REVOKE UPDATE ON accounts FROM accountant;

---- 3
---B
SELECT * FROM transactions;
ALTER TABLE transactions
ALTER COLUMN date SET NOT NULL;
ALTER TABLE transactions
ALTER COLUMN src_account SET NOT NULL;
ALTER TABLE transactions
ALTER COLUMN dst_account SET NOT NULL;
ALTER TABLE transactions
ALTER COLUMN amount SET NOT NULL;
ALTER TABLE transactions
ALTER COLUMN status SET NOT NULL;

---- 5
--- A
CREATE UNIQUE INDEX idx_acc ON accounts(customer_id, currency);

--- B
CREATE INDEX search_t ON accounts(currency, balance);

----6
-- B
update accounts set balance = balance + 100 where account_id = 'NT10204';
update accounts set balance = balance - 100 where account_id = 'RS88012';
commit;

--- C
if balance < limit where account_id = 'RS88012' then rollback;
else commit;

--- D
update accounts set balance = balance + 100 where account_id = 'NT10204';
update accounts set balance = balance - 100 where account_id = 'RS88012';
commit;