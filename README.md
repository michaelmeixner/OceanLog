
# 🌊 OceanLog

**OceanLog** is a mobile app designed for divers, sailors, and ocean enthusiasts to quickly and easily log marine wildlife sightings — even without an internet connection. Unlike existing tools, OceanLog is optimized for underwater conditions and streamlined field use.

---

## 🎯 Project Goals

- Enable fast, offline-friendly wildlife sighting logging
- Provide a dive-friendly user interface with large buttons and minimal input
- Store environmental context (depth, visibility, water temp, behavior)
- Allow exporting or syncing logs for research and conservation
- Visualize sightings on an interactive map or sortable list

---

## 📱 Features (MVP v1.0)

- ✅ Offline support (store locally, sync later)
- ✅ One-tap species selection
- ✅ Optional photo, notes, depth, behavior
- ✅ Map and list view of all logged sightings
- ✅ Export to CSV / JSON
- ✅ Clean, large-button UI for use on boats or in low-visibility dive prep

---

## 🛠️ Tech Stack

| Area            | Tool / Framework                |
|-----------------|----------------------------------|
| Cross-platform UI | [Flutter](https://flutter.dev/)        |
| Local Storage     | [Hive](https://docs.hivedb.dev/) or SQLite |
| Mapping           | [Mapbox](https://docs.mapbox.com/) via Flutter plugin |
| Offline Support   | Built-in via local storage     |
| Species Data      | Local JSON (custom, extensible) |
| Optional Sync     | Firebase (for v2.0+)           |

---

## 🚀 Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/yourusername/OceanLog.git
   cd OceanLog
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app locally**
   ```bash
   flutter run
   ```

---

## 🌍 Screenshots / Wireframes

> Coming soon — visual mockups and app screenshots

---

## 🔮 Planned Features (v2.0+)

- AI-based species identification from photo
- User accounts and cloud sync
- Dive site sharing / hot spots
- Conservation alerts (e.g. endangered species zone notifications)
- Dive computer integration

---

## 🤝 Contributing

We welcome collaborators from all backgrounds — divers, biologists, and developers alike.

### To contribute:
- Fork this repo
- Make your changes
- Submit a pull request

Or submit ideas and feedback via the [Issues](https://github.com/yourusername/OceanLog/issues) tab.

---

## 🐠 License

MIT License — feel free to fork, remix, and build upon OceanLog.

---

## 💙 Why This Project Matters

OceanLog aims to make marine wildlife monitoring more accessible and accurate, helping scientists and conservationists gather data from the field with the help of citizen scientists and nature lovers everywhere.
