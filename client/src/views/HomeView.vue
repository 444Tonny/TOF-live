<template>
  <div class="home">
    <h1>🎮 Vrai ou Faux</h1>
    <p>Choisissez votre mode de jeu</p>
    
    <div class="menu">
      <router-link to="/solo" class="menu-btn solo-btn">
        🎯 Mode Solo
        <span>Jouer seul</span>
      </router-link>
      
      <router-link to="/host" class="menu-btn host-btn">
        🎬 Mode Host
        <span>Contrôler le jeu multi-joueurs</span>
      </router-link>
      
      <router-link to="/play" class="menu-btn player-btn">
        👥 Mode Joueur
        <span>Rejoindre une partie</span>
      </router-link>

      <router-link to="/video" class="menu-btn player-btn">
        🎬 Mode Video
        <span>Pour enregistrer des vidéos</span>
      </router-link>

    </div>
  </div>
</template>

<style scoped>
.home {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding: 20px;
}

h1 {
  font-size: 3rem;
  color: white;
  margin-bottom: 10px;
}

p {
  color: white;
  font-size: 1.2rem;
  margin-bottom: 50px;
  opacity: 0.9;
}

.menu {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  max-width: 900px;
  width: 100%;
}

.menu-btn {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 40px 30px;
  background: white;
  border-radius: 15px;
  text-decoration: none;
  color: #333;
  font-size: 1.5rem;
  font-weight: bold;
  transition: transform 0.3s;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.menu-btn:hover {
  transform: translateY(-5px);
}

.menu-btn span {
  font-size: 0.9rem;
  font-weight: normal;
  color: #666;
  margin-top: 10px;
  text-align: center;
}

.solo-btn:hover {
  background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
  color: white;
}

.solo-btn:hover span {
  color: white;
}

.host-btn:hover {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
}

.host-btn:hover span {
  color: white;
}

.player-btn:hover {
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  color: white;
}

.player-btn:hover span {
  color: white;
}
</style>