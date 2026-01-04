<template>
  <router-view />
</template>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
}

#app {
  min-height: 100vh;
}

:root {
  /* Couleurs principales */
  --color--bg1: #1e1d2a;  
  --color--bg3: #0f0f0f3f;         /* texte clair */
  --color--primary: #5e3681 ;  /* vert principal */

  /* États */
  --color--white: #f0f0f0;
  --color-disabled: #6b7280;

  /* Boutons */
  --color--success: #10b981;
  --color--success2: #10b9815b;
  --color--fail: #ff4949;
  --color--fail2: #ef444442;
}
</style>