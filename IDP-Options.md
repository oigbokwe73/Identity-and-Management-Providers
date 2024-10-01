Based on the provided image and description of the use case, let's expand on the detailed steps for the Multi-Application Single Sign-On (SSO) use case within the MES Portal context.

### Expanded Use Case : Option 1

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

Here is an expanded use case for the steps related to **User Authentication, Data Migration, Synchronization, Data Extraction, and SSO Enablement** based on the provided details:

### Expanded Use Case: Option 2

#### 1. **User Authentication:**
   - **Scenario:** All users must obtain a Medicaid account and use these credentials to log into the MES Portal.
   - **Process:**
     - Users are required to create or verify an existing Medicaid account by registering on the Medicaid portal.
     - The account credentials (username and password) are managed by the Medicaid Identity Provider (IdP).
     - During the initial login attempt to the MES Portal, the user is prompted to authenticate using their Medicaid credentials.
     - Azure B2C acts as an intermediary, redirecting the authentication request to the Medicaid IdP.
     - Upon successful verification, the user is granted access to the MES Portal, and a session token is issued.

#### 2. **Data Migration and Synchronization:**
   - **Scenario:** Auto-sync is established to synchronize Medicaid user data to the Azure Entra ID directory as part of the data migration process.
   - **Process:**
     - The system periodically syncs Medicaid account data with Azure Entra ID (formerly known as Azure Active Directory), ensuring that all user profiles are up-to-date.
     - The synchronization process involves migrating essential user data, such as personal identifiers (e.g., Medicaid ID, user roles, and permissions), to establish the user’s profile in B2C.
     - Any updates to user profiles in Medicaid are automatically reflected in Azure Entra ID through the sync process.
     - This data sync ensures that users who log into the MES Portal using their Medicaid credentials can have consistent access across all module applications tied to B2C.

#### 3. **Data Extraction and Mapping:**
   - **Scenario:** User data is extracted from the various MES module applications (e.g., CARES), and common fields between MES module user data and Medicaid user data are identified to establish links in B2C (one-time and ongoing).
   - **Process:**
     - Each MES module application (such as CARES) stores user-specific data like roles, permissions, and preferences.
     - During the migration phase, data is extracted from these MES module applications.
     - B2C maps common fields between the Medicaid user profile (e.g., Medicaid ID) and the MES application data (e.g., user ID, permissions).
     - Once the fields are identified and mapped, B2C links the user’s Medicaid profile with the corresponding MES module data, ensuring consistent identity and access management.
     - This process happens initially during the user’s first login and is maintained ongoing through synchronization and updates between the MES modules and B2C.

#### 4. **Single Sign-On (SSO) Enablement:**
   - **Scenario:** Upon linking Medicaid and MES module applications in B2C, users can access all applications without re-initiating login.
   - **Process:**
     - After the Medicaid and MES module profiles are linked in B2C, the user can log into the MES Portal once using their Medicaid credentials.
     - The MES Portal grants the user access to all linked module applications without requiring them to re-authenticate each time they switch between modules (Single Sign-On).
     - B2C handles the token issuance for each module, so users can seamlessly transition between applications without repeated logins.
     - If the session expires, the user will be prompted to log in again, but otherwise, the SSO allows continuous access during the active session.

#### 5. **User Account Maintenance:**
   - **Scenario:** Including password resets, may be required at both Medicaid and MES application IdPs.
   - **Process:**
     - Users manage their credentials (password, MFA settings) through their respective Identity Provider (Medicaid IdP for Medicaid credentials).
     - If a user needs to reset their Medicaid password, the request is handled by the Medicaid IdP.
     - Similarly, MES module-specific maintenance activities, such as resetting roles or permissions, are handled by the module's respective IdP.
     - Azure B2C synchronizes the updates from the IdP, ensuring that any changes are reflected in the user's access permissions across all applications.

---

Here is the expanded use case based on the provided steps for **User Login, Authentication, Record Creation, Application Access, New User Provisioning, and User Account Maintenance**:

### Expanded Use Case with Detailed Steps: Option 3

#### 1. **Pre-requisite: Medicaid Account Creation**
   - **Scenario:** All users must obtain a Medicaid account and use these credentials to log into the MES Portal.
   - **Process:**
     - Before accessing the MES Portal, users are required to create a Medicaid account if they don’t already have one.
     - The Medicaid Identity Provider (IdP) is responsible for managing these accounts, including registration and initial authentication.
     - The Medicaid IdP handles password management, MFA configuration, and other security settings related to the user account.

#### 2. **User Login:**
   - **Scenario:** Users must log in to the MES Portal using their Medicaid account credentials.
   - **Process:**
     - When a user attempts to access the MES Portal, they are redirected to the login page, where they must enter their Medicaid credentials (username and password).
     - The MES Portal integrates with Azure B2C, which serves as an intermediary between the portal and the Medicaid IdP.
     - B2C forwards the login request to the Medicaid IdP for authentication.

#### 3. **User Authentication:**
   - **Scenario:** User authentication requests are forwarded to the Medicaid Identity Provider (IdP) for verification. The Medicaid IdP authenticates the user and responds back to Business-to-Consumer (B2C).
   - **Process:**
     - Upon receiving the login credentials, B2C forwards the authentication request to the Medicaid IdP.
     - The Medicaid IdP validates the user’s credentials against its own records.
     - If the credentials are valid, the Medicaid IdP sends an authentication response back to B2C.
     - B2C processes the response and generates an access token for the authenticated user.
     - The token allows secure session management within the MES Portal, enabling the user to access the dashboard and other applications.

#### 4. **Unique Record Creation:**
   - **Scenario:** On successful authentication of the user, B2C will create a unique record into the Entra ID for the user, and the users are redirected to the dashboard page.
   - **Process:**
     - Once the user is authenticated by the Medicaid IdP, B2C generates a unique user record in Entra ID (formerly Azure AD) for tracking and managing user identities within the MES environment.
     - The user record contains essential data, such as the user’s Medicaid ID, role assignments, and access permissions.
     - After the record creation, B2C redirects the user to the MES Portal dashboard.
     - The dashboard displays various portlets (applications), including access to modules such as CARES, based on the user’s permissions.

#### 5. **MES Module Application Access:**
   - **Scenario:** User accessing any MES module application (e.g., CARES) will trigger a request to the application with the Medicaid user data and the access token generated by B2C.
   - **Process:**
     - When the user selects a module (such as CARES) from the MES dashboard, the system sends a request to the respective application.
     - The request includes the user’s Medicaid data and the access token generated by B2C during the initial authentication.
     - The module application verifies the token and user identity to ensure the user has valid permissions to access the application.
     - Once verified, the user is granted access to the specific module without needing to re-authenticate.

#### 6. **New User Provisioning:**
   - **Scenario:** The MES module application will forward the request to the respective IdP to validate the data and provision the user if the user doesn’t exist and respond back to the portal.
   - **Process:**
     - If the user is new to a specific MES module (e.g., CARES), the module forwards the user data and token to its respective Identity Provider (IdP) for validation.
     - The module checks if the user already exists in its system.
     - If the user doesn’t exist, the module’s IdP provisions a new account for the user based on the provided Medicaid data and role assignments.
     - The module then sends a response back to the MES Portal, confirming that the user has been provisioned and is now authorized to access the application.
     - This step ensures that new users are onboarded seamlessly when accessing a new application for the first time.

#### 7. **User Account Maintenance:**
   - **Scenario:** Including password reset, which may be required at both the Medicaid and MES application IdP.
   - **Process:**
     - User account maintenance activities, such as password resets and MFA management, are handled by the respective Identity Providers (IdPs).
     - For Medicaid credentials, password resets are managed by the Medicaid IdP.
     - If the user’s credentials need to be reset or updated for specific MES modules (e.g., CARES), the request is forwarded to the module’s respective IdP.
     - B2C synchronizes any changes made to the user’s account (such as new passwords or updated security settings) across all applications the user has access to.
     - This ensures that users can maintain access to all their linked MES modules with a consistent set of credentials.

---
Here is an expanded use case based on the provided steps related to **User Onboarding, Login, Authentication, Application Access, and Account Maintenance** using **Entra ID** for the MES Portal.

### Expanded Use Case: Option 4

#### 1. **User Onboarding:**
   - **Scenario:** Users sign up with their information, including Multi-Factor Authentication (MFA) preferences. A unique user record is created and persisted in the new Entra ID tenant.
   - **Process:**
     - New users are directed to the MES Portal’s registration page, where they are required to provide essential details, including their name, contact information, and email address.
     - During the onboarding process, users must configure their Multi-Factor Authentication (MFA) preferences. This could include options such as SMS verification, email, or app-based MFA (e.g., Microsoft Authenticator).
     - Entra ID handles the collection of user data, and upon successful registration, a unique user record is created and persisted in the Entra ID tenant.
     - The user record includes attributes such as the user’s MFA settings, roles, permissions, and any linked application accounts.
     - Once the onboarding is complete, the user is ready to log in to the MES Portal using their new Entra ID account.

#### 2. **User Login:**
   - **Scenario:** All users should log in to the MES Portal using their new MES Portal Entra ID account.
   - **Process:**
     - Users navigate to the MES Portal login page and are prompted to enter their Entra ID credentials (username and password) created during onboarding.
     - Entra ID manages the authentication flow, including verifying the user’s identity through their credentials.
     - If the user has MFA configured, they are required to provide additional verification through their selected MFA method (e.g., receiving a code via SMS or using an authenticator app).
     - Once the user’s identity is verified, Entra ID issues a token, granting access to the MES Portal dashboard.
     - The login process ensures that the user’s identity is consistent across all modules linked to the MES Portal.

#### 3. **User Authentication:**
   - **Scenario:** Entra ID performs user authentication, and successful authentication grants access to the portal dashboard page.
   - **Process:**
     - Entra ID acts as the identity provider (IdP) for the MES Portal, handling all authentication requests.
     - When the user submits their login information, Entra ID verifies the credentials against the stored user records.
     - If the authentication is successful, the user is granted access to the MES Portal.
     - The portal’s dashboard is dynamically populated with portlets corresponding to the user’s roles and access permissions.
     - For added security, Entra ID tracks session information and ensures that any failed login attempts trigger security mechanisms, such as MFA or account lockout after repeated failed attempts.

#### 4. **MES Module Application Access:**
   - **Scenario:** All the MES module applications must use Entra ID as their IdP instead of their current configuration to allow the user to access the application. This, in turn, will enable a Single Identity maintained across all the module applications.
   - **Process:**
     - MES module applications (e.g., CARES) are configured to use Entra ID as their primary identity provider, ensuring all user authentication flows through Entra ID.
     - When the user attempts to access a specific MES module from the portal, the module sends an authentication request to Entra ID, including the user’s session token or credentials.
     - Entra ID validates the request, ensuring that the user has the necessary permissions to access the application.
     - If the validation is successful, the MES module grants access without requiring the user to re-enter credentials (Single Sign-On).
     - By using Entra ID for all MES modules, a single identity is maintained across the platform, allowing users to seamlessly switch between applications without multiple logins.

#### 5. **User Account Maintenance:**
   - **Scenario:** All account maintenance functions are owned by MES Portal Entra ID.
   - **Process:**
     - Entra ID manages all user account maintenance functions, including password resets, updating MFA settings, and changing user roles or permissions.
     - Users can reset their passwords by initiating a request through the MES Portal or Entra ID self-service password reset flow.
     - MFA configuration changes (e.g., adding or removing a verification method) are also handled by Entra ID, ensuring that users have control over their security settings.
     - Any updates to the user’s account, such as role changes or revocation of access, are reflected across all MES modules since all applications rely on Entra ID for identity management.
     - Regular synchronization between Entra ID and MES modules ensures that any changes made to a user’s account are immediately reflected in all linked applications.

---
