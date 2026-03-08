# Azure DevOps: Web App Monitoring & Alerting 🛡️

## Project Overview

This project demonstrates the implementation of a full-stack monitoring solution for a cloud-based web application. Using **Azure Application Insights** and **Azure Monitor**, I established a proactive observability framework that tracks application health, global availability, and real-time failure rates.

### The Problem (Scenario)

How do we ensure a web application is "healthy" beyond just knowing the server is "on"? We need to know:

1. Is the site reachable from New York, London, and Tokyo?
2. Are users experiencing internal code errors?
3. Can the DevOps team be notified automatically before customers complain?

---

## Tech Stack

* **Cloud Provider:** Microsoft Azure
* **Hosting:** Azure App Service (Linux/Node.js)
* **Monitoring:** Azure Application Insights
* **Alerting:** Azure Monitor (Action Groups & Alert Rules)
* **Telemetry:** Kusto Query Language (KQL)

---

## Project Phases

### Phase 1: Infrastructure Setup

* Deployed a **Log Analytics Workspace** to act as the central data repository.
* Provisioned an **App Service** to host the web application.
* Created a **Workspace-based Application Insights** resource.

### Phase 2: Codeless Instrumentation

* Connected the Node.js application to Application Insights using **Auto-instrumentation**.
* Configured Environment Variables (`APPLICATIONINSIGHTS_CONNECTION_STRING`) to enable telemetry collection without modifying the application source code.
* **[INSERT SCREENSHOT: Live Metrics Stream showing request spikes]**

### Phase 3: Global Availability Testing

* Configured a **Standard Availability Test** to "ping" the application URL every 5 minutes.
* Selected 5 global test locations to ensure regional reachability.
* Set up SSL certificate monitoring to alert if the site's security certificate is within 7 days of expiration.
* **[INSERT SCREENSHOT: Availability Map with green/red status dots]**

### Phase 4: Alerting & Incident Response

* Created an **Action Group** to route critical notifications to the DevOps team via email.
* Established **Alert Rules**:
* **High Failure Rate:** Triggers if more than 5 failed requests occur within 5 minutes.
* **Downtime Alert:** Triggers if global availability drops below 90%.



### Phase 5: Validation & Chaos Testing

* Manually triggered a "High Error Rate" by generating 404 errors via the browser.
* Simulated a "Site Down" event by stopping the App Service.
* **Result:** Successfully received automated "Fired" and "Resolved" emails from Azure Monitor.
* **[INSERT SCREENSHOT: The Alert email notification from your inbox]**

---

## Key Learnings

* **Proactive vs. Reactive:** Learned how to set thresholds that notify engineers *before* an outage becomes critical.
* **Global Perspective:** Understood that "Up" for me doesn't mean "Up" for a user in another continent.
* **Cloud Governance:** Organized all resources within a single Resource Group for lifecycle management and cost tracking.

---

## How to View

1. Navigate to the `/screenshots` folder to see the monitoring dashboards in action.
2. The `deployment-notes.md` contains the specific Environment Variables used for Node.js instrumentation.

---

