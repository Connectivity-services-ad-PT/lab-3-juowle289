# Consumer–Provider Handshake

## Thông tin chung

- Lab: FIT4110 Lab 03
- Ngày: 24/05/2026
- Provider team: Core Business
- Consumer team: Access Gate
- Provider service: Core Business — Policy Evaluation
- Consumer service: Access Gate — Kiểm soát ra/vào

## Contract

- Contract file: `contracts/team-gate.openapi.yaml`
- Mock base URL: `http://localhost:4013` (Core Business mock)
- Auth method: Bearer token (`Authorization: Bearer {{authToken}}`)
- Endpoint được test: `POST /policies/evaluate-access`

## Smoke test

### Request

```http
POST /policies/evaluate-access
Authorization: Bearer lab-token
Content-Type: application/json
```

```json
{
  "card_id": "CARD-001",
  "gate_id": "GATE-A1",
  "direction": "entry",
  "role": "student"
}
```

### Expected response

```json
{
  "result": "allow",
  "reason": "valid_card_and_permission"
}
```

## Kết quả

- [x] Consumer gọi mock thành công.
- [x] Consumer parse được field cần dùng.
- [x] Consumer hiểu lỗi 4xx/5xx provider trả về.
- [x] Có Newman report hoặc screenshot.

## Ghi chú thay đổi hợp đồng

| Nội dung                                         | Trước    | Sau                           | Người đồng ý          |
| ------------------------------------------------ | -------- | ----------------------------- | --------------------- |
| Thêm field `reason` vào response evaluate-access | không có | string mô tả lý do allow/deny | team-core + team-gate |

## Xác nhận

- Provider representative: Lê Tiến Được
- Consumer representative: Lê Tiến Được
