const pool = require('./_lib/db');

module.exports = async (req, res) => {
    // Debug info
    console.log('=== API/PACKAGES START ===');
    console.log('Environment Check:');
    console.log('NODE_ENV:', process.env.NODE_ENV);
    console.log('DB_HOST:', process.env.DB_HOST);
    console.log('DB_USER:', process.env.DB_USER);
    console.log('DB_NAME:', process.env.DB_NAME);
    // Do not log full password
    console.log('DB_PASSWORD length:', process.env.DB_PASSWORD ? process.env.DB_PASSWORD.length : 'NOT SET');
    console.log('DB_PORT:', process.env.DB_PORT);

    // Enable CORS
    res.setHeader('Access-Control-Allow-Credentials', 'true');
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version, Authorization');

    // Handle OPTIONS preflight
    if (req.method === 'OPTIONS') {
        res.status(200).end();
        return;
    }

    // Only allow GET
    if (req.method !== 'GET') {
        return res.status(405).json({ error: 'Method not allowed' });
    }

    try {
        console.log('Querying database...');
        const result = await pool.query(
            'SELECT * FROM packages WHERE is_active = true ORDER BY display_order ASC'
        );
        console.log('Query success. Rows:', result.rows.length);

        res.status(200).json(result.rows);
    } catch (error) {
        console.error('=== FATAL ERROR ===');
        console.error('Message:', error.message);
        console.error('Stack:', error.stack);
        console.error('Code:', error.code);
        if (error.originalError) {
            console.error('Original Error:', error.originalError);
        }
        res.status(500).json({
            error: 'Failed to fetch packages.',
            details: error.message,
            code: error.code
        });
    }
};
