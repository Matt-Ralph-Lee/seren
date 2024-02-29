# Seren - A Flutter App for Serendipitous Encounters

**Seren** is a captivating Flutter app designed to enhance serendipitous encounters between users in a positive and spontaneous manner.

## Project Overview

- **Daily Notification Prompt**: Users receive a daily notification, prompting them to capture a moment by taking a picture within two minutes. The app also allows users to post "late" pictures, with an annotation indicating the duration of the delay.

- **Dual Camera Functionality**: Pictures are taken using both the front and back cameras, ensuring an authentic representation of the user's appearance.

- **Stranger Connections through Swiping**: Users can connect with strangers by swiping through profiles. Taking a picture serves as the catalyst for potential connections, fostering unexpected and delightful interactions.

- **Real-time Authenticity**: Since users are encouraged to capture moments instantly after receiving the notification, the pictures authentically reflect the user's appearance. Late posts are marked with an annotation indicating the delay duration.

- **Mutual Friendship**: Users can only become friends with a stranger if both parties express mutual interest by swiping right, fostering genuine connections.

- **In-App Chat**: Once connected as friends, users can engage in chat conversations, facilitating communication and connection.

- **Friends Feed**: Users can enjoy a friends feed, showcasing pictures taken by friends specifically after receiving the daily notification. This feature provides a dynamic and shared visual experience among friends.

## Directory Structure

### Backend

The `backend` directory focuses on server-side functionality, managing database interactions, authentication, and server-related tasks.

- **functions**: Manages the connection between external resources, handling authentication, notifications, and server operations.

- **model**: Contains domain-related logic, defining rules for various models.

- **repository**: Facilitates connections to external database resources, including Firebase Realtime Database and Firestore.

- **state**: Centralized location for managing application state, specifically data reliant on the database or authentication.

- **usecase**: Holds singleton classes, each containing a single-use case function.

### Presentation

The `presentation` directory focuses on the user interface (UI) and related components.

- **components**: Contains subdirectories for single functions (`parts`) and UI components representing single use cases (`widgets`).

- **controllers**: Manages the connection between the backend and presentation using Riverpod for future or stream use cases.

- **pages**: Each file represents a distinct page that users can view.

- **routers**: Manages routing using `go_router` and includes private pages accessible only when the user is logged in.

- **shared**: Contains subdirectories for shared constants and utilities, including assets, localization, settings, and page paths.

### DTO

The `dto` directory contains models utilized in both the backend and presentation layers, representing classes displayable or usable in the presentation field.

Feel free to explore each directory to gain a deeper understanding of the project's organization and functionality. If you have any questions or need further clarification, don't hesitate to reach out.
