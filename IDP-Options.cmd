Based on the provided image and description of the use case, let's expand on the detailed steps for the Multi-Application Single Sign-On (SSO) use case within the MES Portal context.

### Expanded Use Case with Steps:

#### 1. **Multi-Application Single Sign-On (SSO):**
   - **Scenario:** A user logs into the MES Portal using credentials from any MES module application.
   - **Process:** 
     - The user clicks on the portal link or navigates directly to the MES Portal.
     - The portal prompts for login credentials, allowing the user to authenticate using credentials from any MES application (via federated login with B2C acting as the Identity Service Manager).
     - B2C performs identity verification, using the appropriate Identity Provider (IdP) for the selected module application.
     - Upon successful authentication, B2C issues a token for the user that grants access to the portal and tracks user session state.

#### 2. **Trust Establishment:**
   - **Scenario:** A trust relationship is established between the MES module applications and the Identity Service Manager (B2C).
   - **Process:** 
     - The MES Portal is integrated with B2C, which acts as a central identity management service for all module applications.
     - B2C handles the trust relationship with various IdPs associated with each MES module application, ensuring secure authentication and Single Sign-On (SSO) across the applications.
     - Trust establishment is achieved by exchanging security tokens and creating secure session cookies that facilitate seamless access across the MES ecosystem.
   
#### 3. **Initial Login and Dashboard Access:**
   - **Scenario:** Users are redirected to the dashboard after successful login, showing all available portlets.
   - **Process:**
     - After B2C successfully authenticates the user, the MES Portal redirects the user to a personalized dashboard.
     - The dashboard displays a collection of portlets (or chicklets), each representing an available MES module application or functionality the user is authorized to access.
     - The list of available portlets is dynamically generated based on the user’s roles, permissions, and linked accounts in B2C.

#### 4. **Portlet-Specific Authentication:**
   - **Scenario:** Users are prompted to enter application-specific credentials when accessing a portlet for the first time.
   - **Process:**
     - When a user clicks on a portlet to access a specific application for the first time, B2C checks if an existing session or user credential is available for that specific application.
     - If not, the user is redirected to the relevant application's login page to enter application-specific credentials.
     - B2C securely stores the application's credentials (if applicable) or tokens for future access, so the user is not required to re-enter credentials for subsequent logins.

#### 5. **Linking Users from MES Module Applications:**
   - **Scenario:** B2C persists user IDs upon successful login to each application, enabling subsequent access without requiring re-login.
   - **Process:**
     - Once the user successfully logs into the application via the portlet, B2C persists the user’s credentials, session tokens, or IDs associated with that application.
     - The next time the user attempts to access the same application, B2C retrieves the stored credentials or tokens, allowing immediate access without re-authentication.
     - This creates a seamless experience, where users can switch between applications without logging in multiple times.

#### 6. **Successive Login Handling:**
   - **Scenario:** B2C manages successive logins to each application without requiring re-login.
   - **Process:**
     - B2C uses the token-based authentication mechanism to track user sessions across different applications.
     - Once a user has authenticated for a particular application, B2C issues a token that can be reused for future access to that application or any other linked applications.
     - The user’s active session is maintained as long as it’s valid, and tokens are refreshed as necessary based on the application's policies and security requirements.

#### 7. **User Account Maintenance:**
   - **Scenario:** Password resets and other maintenance activities are owned by the respective IdP.
   - **Process:**
     - If a user needs to reset their password or change security settings, B2C redirects the request to the appropriate Identity Provider (IdP) for the MES module application.
     - Each IdP is responsible for managing password policies, reset requests, MFA setups, and other user account maintenance activities.
     - B2C ensures that any changes in user credentials or security preferences (such as MFA settings) are updated and synchronized across all linked MES applications.
     - If an account becomes inactive or credentials are invalid, B2C will reflect this status and block access to related portlets in the MES Portal until the issue is resolved at the IdP level.

---

These expanded steps illustrate how the Multi-Application SSO with B2C provides a seamless and secure user experience, ensuring trust, session management, and proper linking between various MES module applications.
