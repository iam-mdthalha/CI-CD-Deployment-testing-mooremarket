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
      <p style={styles.subtitle}>Your Premium Shopping Destination</p>
      <p style={styles.subtitle}>Green container</p>
      <div style={styles.status}>
        <div style={styles.dot}></div>
        <span>System Online</span>
      </div>
      <p style={styles.footer}>© 2026 MooreMarket. All rights are reserved.</p>
    </div>
  );
};

export default App;
