const AUTH_PASSWORD = process.env.GAME_PASSWORD || 'G4m3!444';

const authMiddleware = (req, res, next) => {
    const password = req.headers['x-game-password'];
    
    if (password === AUTH_PASSWORD) {
        next();
    } else {
        res.status(401).json({ message: 'Mot de passe incorrect' });
    }
};

module.exports = authMiddleware;