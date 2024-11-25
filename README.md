# Jumbles

A federated groups service built with ActivityPub, enabling decentralized community management and interaction across the fediverse.

Open source, free as in speech and free as in beer.

The flagship instance is at [jumbles.zone](https://jumbles.zone), and is heavily protective of its users, but we very much encourage you to run your own!

## Features

- **Group Management**
  - Group creation and management
    - Profile information editing.
    - Extended "home" page detailing group purpose, rules, and other information.
  - Permission levels:
    - Owner: There can be only one.
    - Admin: Can manage group settings and invite/promote users.
    - Moderator: Can manage group content and membership.
    - Approver: Can approve or reject membership requests.
  - "Approval required" group membership
    - Fediverse users who request to follow are messaged a link to an application form.
    - Approvers must approve applications before the follow is approved.
  - Public and private group options
    - Public groups are open to follows and have no membership requirements.
    - Private groups require application and approval.
  - Group moderation tools
    - All groups (public and private) can be moderated by blocking bad actors.
    - Banned users can have all of their content redacted.

- **Federation**
  - ActivityPub protocol support
  - Interoperability with other ActivityPub servers
  - Supports only group functionality (no personal fediverse users/timelines).
  - Users must be registered on an existing (external, federated) instance to participate.

- **Database Support**
  - Pluggable multi-database architecture
  - Currently supported:
    - BadgerDB (embedded database)
  - Planned support for:
    - MongoDB
    - PostgreSQL
    - MySQL
  - Extensible database interface for custom implementations

- **User Features**
  - Secure authentication system
    - BCrypt password hashing
    - Session-based login
    - Planned support for:
      - Passkeys
      - OAuth
      - WebAuthn
  - Profile customization
  - Activity feeds
  - Notifications
  - Content moderation tools

## Getting Started

### Prerequisites

- Go 1.22 or higher
- Node.js 20+ and pnpm

### Installation

1. Clone the repository:

```bash
git clone https://github.com/blahaj.zone/jumbles.git
cd jumbles
```

2. Install backend dependencies:

```bash
go mod download
```

3. Install frontend dependencies:

```bash
cd ui
pnpm install
```

### Configuration

1. Copy the example configuration file and edit it to your liking:

(Note: If you don't do this, the application will create a default configuration file for basic dev/test for you on first run)

```bash
cp .env.default .env
```

### Running the Server

#### Development Mode

1. Start the backend server:

```bash
make dev
```

2. In another terminal, start the frontend:

```bash
cd ui
npm run dev
```

#### Production Mode

1. Build the frontend:

```bash
cd ui
npm run build
```

2. Build and start the server:

```bash
make build
```

### Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Manual Deployment

1. Build the application
2. Configure your reverse proxy (Caddy, nginx, etc.)
3. Set up SSL certificates (if not using Caddy, which supports automatic HTTPS)
4. Configure your database
5. Start the server

## API Documentation

API documentation is in `api_documentation.md`, also `postman.json` provides a Postman collection for easy import/testing.

## Security

- BYO TLS [via your reverse proxy] no built-in termination
- CORS configuration
- Rate limiting
- Input validation
- XSS protection
- CSRF protection

## License

This project is licensed under the GPLv3 license. Forever and always open source, never commercial.

If you build something on top of this, it must also be open source and licensed under the GPLv3 license.

## Roadmap

- ActivityPub federation support
  - [x] Accept / Reject followers
  - Inbox management:
    - [x] Receive notes (dm/post/boost)
  - Outbox management:
    - [x] Boost notes to followers
    - [x] Send direct notes to followers
  - Follower management:
    - [x] Approve followers (auto and approved)
    - [x] Reject followers
    - [x] Block followers
    - [x] Redact boosted notes from followers
  - [ ] Group profiles
  - [x] WebFinger support
- Database support
  - [x] BadgerDB
  - [ ] MongoDB
  - [ ] PostgreSQL
  - [ ] MySQL
- Authentication support
  - [x] BCrypt password hashing
  - [x] JWT authentication tokens
  - [ ] OAuth
  - [ ] WebAuthn
  - [ ] Passkeys
- Application notifications:
  - [ ] Pushover
  - [ ] Discord
  - [ ] Telegram
- Automated account recovery
  - [ ] Email
