const { exec } = require('child_process');
const path = require('path');
const fs = require('fs').promises;
const crypto = require('crypto');

/**
 * Service pour Piper TTS (Text-to-Speech local)
 */
class PiperService {
    constructor() {
        // Détection automatique de l'environnement
        const isWindows = process.platform === 'win32';
        const isProduction = process.env.NODE_ENV === 'production';

        if (isWindows) {
            console.log('⚙️ Environnement Windows détecté');
            // Local Windows
            this.piperPath = 'C:\\ProgrammesPersonnels\\piper_windows_amd64\\piper\\piper.exe';
            this.modelPath = 'C:\\ProgrammesPersonnels\\piper_windows_amd64\\piper\\espeak-ng-data\\voices\\en_US-bryce-medium.onnx';
        } else {
            console.log('⚙️ Environnement Linux détecté');
            // Production Linux (Coolify)
            this.piperPath = '/root/.local/bin/piper'; // Commande globale
            this.modelPath = '/opt/piper-voices/en_US-lessac-medium.onnx';
        }

        this.outputDir = path.join(__dirname, '../../public/audio/temp');
        this.ensureOutputDir();
    }

    async ensureOutputDir() {
        try {
            await fs.mkdir(this.outputDir, { recursive: true });
        } catch (error) {
            console.error('Erreur création dossier audio:', error);
        }
    }

    /**
     * Générer l'audio depuis le texte
     */
    async textToSpeech(text) {
        try {
            const hash = crypto.createHash('md5').update(text).digest('hex');
            const outputFile = path.join(this.outputDir, `${hash}.wav`);

            // Cache : si déjà généré, retourner directement
            try {
                await fs.access(outputFile);
                return outputFile;
            } catch {
                // Continuer si pas en cache
            }

            // Créer un fichier texte temporaire (plus fiable que echo)
            const textFile = path.join(this.outputDir, `${hash}.txt`);
            await fs.writeFile(textFile, text, 'utf8');

            // Commande Piper
            const command = `"${this.piperPath}" --model "${this.modelPath}" --output_file "${outputFile}" < "${textFile}"`;

            await this.executeCommand(command);

            // Nettoyer le fichier texte
            await fs.unlink(textFile).catch(() => { });

            return outputFile;

        } catch (error) {
            console.error('Erreur Piper TTS:', error);
            throw new Error('Impossible de générer l\'audio');
        }
    }

    executeCommand(command) {
        return new Promise((resolve, reject) => {
            exec(command, { encoding: 'utf8' }, (error, stdout, stderr) => {
                if (error) {
                    console.error('Stderr:', stderr);
                    reject(error);
                } else {
                    resolve(stdout);
                }
            });
        });
    }
}

module.exports = new PiperService();