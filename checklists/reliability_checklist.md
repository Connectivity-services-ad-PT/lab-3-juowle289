# Reliability Checklist — FIT4110 Lab 03 — team-gate

Điền checklist này trước khi nộp Lab 03.

## 1. Functional tests

- [x] Có test cho endpoint `/health`.
- [x] Có test happy path cho endpoint chính (`POST /access-events`).
- [x] Có kiểm tra status code 2xx (201 cho POST, 200 cho GET).
- [x] Có kiểm tra field quan trọng trong response (`event_id`, `result`, `card_id`).
- [x] Có test đọc dữ liệu danh sách (`GET /access-events`) và chi tiết (`GET /cards/{card_id}`).

## 2. Auth tests

- [x] Có test thiếu token (TC08 — skip trên mock, chạy trên local).
- [x] Có test sai token hoặc token rỗng (TC09 — skip trên mock, chạy trên local).
- [x] Endpoint public được khai báo rõ (`GET /health` — `security: []`).
- [x] Test thể hiện đúng expected status 401/403 trên local environment.

## 3. Negative tests

- [x] Có test thiếu field bắt buộc (TC10 — thiếu `card_id`, TC11 — thiếu `gate_id`).
- [x] Có test sai kiểu dữ liệu (TC12 — `direction` sai enum).
- [x] Có test sai enum hoặc giá trị ngoài miền (TC13 — `role` không hợp lệ).
- [x] Lỗi trả về theo cùng một error model (`ProblemDetails`: `type`, `title`, `status`, `detail`).

## 4. Boundary tests

- [x] Có test limit/pagination sát ngưỡng (TC15 — limit=100, TC16 — limit=101, TC17 — limit=1).
- [x] Có test filter theo enum (`result=allow` — TC18).
- [x] Có ghi chú kỳ vọng xử lý dữ liệu biên (limit max=100, min=1).
- [x] Card không tồn tại trả về 404 (TC14 — CARD-999).

## 5. Reliability tests cơ bản

- [x] Có kiểm tra response time (TC20, TC21 — local only).
- [x] Có mô tả timeout mong muốn: `POST /access-events` < 1000ms, `GET /access-events` < 2000ms.
- [x] Test latency được skip trên mock environment, chỉ chạy trên local.
- [x] Có consumer-side smoke test gọi mock Core Business (TC19).

## 6. Evidence

- [x] Collection export JSON: `postman/collections/team-gate.postman_collection.json`
- [x] Environment mock export JSON: `postman/environments/team-gate_mock.postman_environment.json`
- [x] Environment local export JSON: `postman/environments/team-gate_local.postman_environment.json`
- [ ] Newman report XML/HTML: cần chạy `npm run test:mock` để sinh file vào `reports/`
- [x] Test-case matrix đã điền: `templates/test-case-matrix.csv`
- [x] Biên bản handshake đã điền: `templates/consumer-provider-handshake.md`