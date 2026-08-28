# 🌱 Green Roof AI — SIH Full Stack Prototype (Pro Edition)

**AI-Assisted Rooftop Greening, Structural Safety & Biosolar Decision Platform**  
*Built for Smart India Hackathon (SIH) — Sustainable Urban Infrastructure & Clean Tech*

---

## 🚀 Key Features & Hackathon Highlights

### 1. 👁️ Visual AI Rooftop Canvas & Obstacle Segmentation
- **Obstacle Detection & Masking**: Automatically flags water tanks, HVAC compressors, staircases, and solar panel arrays on uploaded rooftop photos.
- **Thermal Hotspot Simulation Overlay**: Simulates rooftop surface heat (55°C concrete vs. 30°C vegetated microclimate).
- **Dynamic Net Usable Deck Calculation**: Calculates the actual usable square footage for greening after subtracting obstacles and parapet buffer margins.

### 2. 🏗️ Civil Engineering & Structural Load Validator (IS 875 / NBC 2016)
- **Dead Weight vs. Saturated Load Analysis**: Calculates dry soil + saturated waterlogged weight ($\text{kg/m}^2$ and $\text{kN/m}^2$) for 50mm–150mm lightweight substrate depths.
- **Structural Safety Traffic-Light Rating**: Evaluates structural safety against standard Indian roof slab designs (125mm/150mm RCC, Brick Bat Coba, Precast, Metal Deck).
- **Interactive 7-Layer Architectural Cutaway Visualizer**: Interactive cross-section showcasing the full engineering stack (*Slab → Waterproofing → Root Barrier → Dimpled HDPE Drainage Tray → Filter Fleece → Engineered Substrate → Native Flora*).

### 3. ⚡ Biosolar Synergy & Indian Municipal Property Tax / Energy ROI
- **Solar PV Efficiency Gain**: Co-locating green roof groundcover lowers ambient air temperatures around solar panels by 10°C–15°C, preventing thermal derating and boosting solar output by **+8.5% to +14% annually**.
- **Top-Floor HVAC AC Bill Reduction**: Thermal insulation reduces top-floor air conditioning energy consumption by **18%–25%**.
- **City-Specific Municipal Rebate Engine**: Built-in tax policies for **Bengaluru (BBMP), Mumbai (MCGM), Hyderabad (GHMC), Pune (PMC), Delhi (MCD), Chennai (GCC)**.
- **Financial Payback**: Computes initial turnkey setup cost vs. annual financial returns $\rightarrow$ **Payback Period in Years (e.g., 3.8–4.8 Years)**.

### 4. 🌿 Urban Heat Island (UHI) & Environmental Impact Modeler
- **Surface & Indoor Temp Drop**: Surface temp drops by up to $-26^\circ\text{C}$ and indoor ambient temp drops by $-2.5^\circ\text{C}$ to $-4.2^\circ\text{C}$.
- **Carbon Sequestration & Oxygen Output**: Annual $\text{CO}_2$ absorbed ($\text{kg/yr}$) and $\text{O}_2$ produced based on plant species and square footage.
- **Stormwater Retention**: Estimated rainwater capture in Liters/year.

### 5. 📡 IoT Digital Twin & Predictive Weather-Aware Irrigation
- **Real-Time Telemetry Dials**: Substrate moisture %, root-zone temperature, cistern storage level, and solenoid drip valve state.
- **Predictive Irrigation Engine**: Integrates live Open-Meteo rainfall forecast—if precipitation is predicted within 7 days, the system automatically pauses the drip irrigation cycle to conserve stored rainwater.

### 6. 🤖 Embedded "GreenAI" Sustainable Rooftop Consultant
- Floating on-screen conversational assistant answering queries regarding soil mixes, municipal rebate procedures, pest IPM, and structural guidelines.

### 7. 📄 1-Click Detailed Project Report (DPR) & BOQ Generator
- Print/PDF export formatted as a Smart City Feasibility Report with Bill of Quantities (BOQ), structural compliance summary, and municipal incentive application template.

---

## 🏃 Quick Start

1. (Recommended) Set your Gemini API key so real AI rooftop-image verification works:
   - macOS/Linux: `export GEMINI_API_KEY="your-key-here"`
   - Windows (cmd): `set GEMINI_API_KEY=your-key-here`
   - Windows (PowerShell): `$env:GEMINI_API_KEY="your-key-here"`
   - Get a free key at https://aistudio.google.com/app/apikey
   - If you skip this step, the server falls back to the key baked into `server.js` for prototype convenience — replace/rotate that key before sharing this project publicly.
2. Start the app with **`start.bat`** (or `Launch_Green_Roof_AI.bat`, or `node server.js` in a terminal) — either one now starts the local server and opens `http://localhost:8787` for you.
   - ⚠️ Do **not** open `index.html` by double-clicking it directly. Since real AI verification calls a backend to protect your API key, the app must be served over `http://localhost:8787`, not opened as a bare `file://` page.
3. Open your browser at:
   ```
   http://localhost:8787
   ```
4. Upload a terrace photo (or test with drag-and-drop), allow GPS or select demo location, and click **Generate Full AI Assessment**.

### 🖼️ How rooftop image validation works now
- Step 1 upload runs two checks before an image is accepted:
  1. **Fast local pre-filter** (in the browser) — instantly rejects obvious portraits/selfies and document/infographic screenshots using pixel-level heuristics.
  2. **Real AI verification** (server-side, `POST /api/verify-rooftop`) — the photo is sent to your Node server, which asks Gemini Vision whether the image genuinely shows a rooftop/terrace. Only images the model confirms as a rooftop (confidence ≥ 55) are accepted; everything else (cars, rooms, streets, animals, food, etc.) is now correctly rejected with the AI's stated reason.
- The Gemini API key is only ever used server-side and is never sent to the browser.

---

## 🛠️ API Endpoints Summary

| Method | Endpoint | Description |
| :--- | :--- | :--- |
| `GET` | `/api/health` | Service health and active feature flags |
| `GET` | `/api/plants` | Indigenous Indian plant catalogue with CAM / carbon rates |
| `GET` | `/api/municipal-policies` | Property tax rebate policies for Indian cities |
| `POST` | `/api/assessment` | Comprehensive 6-factor suitability scorecard & BOQ |
| `POST` | `/api/structural-check` | IS 875 dead load vs saturated safety factor calculator |
| `POST` | `/api/biosolar-roi` | Biosolar PV efficiency boost & financial payback period |
| `POST` | `/api/iot-telemetry` | Simulated live sensor telemetry & predictive irrigation |
| `POST` | `/api/ask-ai` | GreenAI sustainable engineering advisory chatbot |
| `POST` | `/api/scenario` | Interactive coverage sensitivity comparison |
| `POST` | `/api/verify-rooftop` | Server-side AI (Gemini Vision) check that an uploaded photo is genuinely a rooftop/terrace |
