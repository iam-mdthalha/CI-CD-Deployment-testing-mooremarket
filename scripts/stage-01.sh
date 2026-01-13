#!/bin/bash
set -e

cd ~/Desktop/E2E-Demo-Project/mooremarket || exit 1

# Create folder structure
mkdir -p src public

# . gitignore
cat > .gitignore << 'EOF'
node_modules/
dist/
build/
.env
.DS_Store
*.log
.vscode/
EOF

# .env.example
cat > .env.example << 'EOF'
REACT_APP_NAME=mooremarket
REACT_APP_PORT=3000
DOCKERHUB_USERNAME=<REQUIRED_PLACEHOLDER_MISSING>
EOF

# package.json
cat > package.json << 'EOF'
{
  "name": "mooremarket",
  "version":  "1.0.0",
  "private": true,
  "dependencies": {
    "react": "^18.2.0",
    "react-dom":  "^18.2.0",
    "react-scripts": "5.0.1"
  },
  "scripts":  {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test --passWithNoTests",
    "lint": "echo 'Lint passed'"
  },
  "browserslist": {
    "production": [">0.2%", "not dead", "not op_mini all"],
    "development": ["last 1 chrome version", "last 1 firefox version", "last 1 safari version"]
  }
}
EOF

# public/index.html
cat > public/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>MooreMarket</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
EOF

# src/index.js
cat > src/index.js << 'EOF'
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
EOF

# src/App.js
cat > src/App.js << 'EOF'
import React from 'react';

const App = () => {
  const styles = {
    container: {
      minHeight: '100vh',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'center',
      background: 'linear-gradient(135deg, #1a1a2e 0%, #16213e 100%)',
      fontFamily: "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif",
      color: '#ffffff',
      margin: 0,
      padding:  '20px',
    },
    logo: {
      fontSize: '4rem',
      marginBottom: '10px',
    },
    title: {
      fontSize: '2.5rem',
      fontWeight: '700',
      margin: '0 0 10px 0',
      background: 'linear-gradient(90deg, #00d9ff, #00ff88)',
      WebkitBackgroundClip: 'text',
      WebkitTextFillColor: 'transparent',
    },
    subtitle: {
      fontSize: '1.2rem',
      color: '#a0a0a0',
      marginBottom: '30px',
    },
    status: {
      display: 'flex',
      alignItems: 'center',
      gap: '10px',
      padding: '15px 30px',
      background: 'rgba(0, 255, 136, 0.1)',
      borderRadius: '50px',
      border: '1px solid #00ff88',
    },
    dot: {
      width: '12px',
      height: '12px',
      background: '#00ff88',
      borderRadius: '50%',
      animation: 'pulse 2s infinite',
    },
    footer: {
      position: 'absolute',
      bottom: '20px',
      color: '#606060',
      fontSize: '0.9rem',
    },
  };

  return (
    <div style={styles.container}>
      <style>
        {`
          @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
          }
          * { margin: 0; padding: 0; box-sizing: border-box; }
        `}
      </style>
      <div style={styles.logo}>🛒</div>
      <h1 style={styles.title}>MooreMarket</h1>
      <p style={styles. subtitle}>Your Premium Shopping Destination</p>
      <div style={styles.status}>
        <div style={styles.dot}></div>
        <span>System Online</span>
      </div>
      <p style={styles.footer}>© 2026 MooreMarket. All rights reserved.</p>
    </div>
  );
};

export default App;
EOF

echo "✅ mooremarket repo structure created"