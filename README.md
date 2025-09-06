Posts-Frontend-Flutter
“Posts” is a full-stack project I built completely from scratch, covering both the backend and the frontend. “Posts” is a full-stack project I built completely from scratch, covering both the backend and the frontend. On the backend, I used Laravel to design and secure a set of RESTful APIs, while also building an admin dashboard with Blade templates so administrators can easily manage content. For authentication, I combined Laravel UI + JWT, added middleware for security, and applied role-based authorization to make sure users can only access what they’re allowed to. On the Laravel side, I focused on: ● Building consistent APIs using Laravel Resources.

● Securing requests with middleware, validation, and permission checks.

● Giving admins powerful tools: full CRUD for posts and users, filtering by author/title, sorting by publish date, and handling archived posts.

On the frontend, I built a Flutter mobile app that consumes these APIs. I used both http and dio to experiment with different networking approaches, and relied on GetX for clean state management, dependency injection, and routing. The app supports: ● User authentication (login & registration).

● Viewing a feed of posts with filtering and pagination.

● Creating, editing, and deleting posts — with authorization ensuring users only control their own content.

For admins, the dashboard is entirely web-based using Blade, while the Flutter app is dedicated to user interaction with the APIs. This project gave me hands-on experience with end-to-end full-stack development: from designing APIs and securing them with JWT, to building a mobile app that integrates them seamlessly.
