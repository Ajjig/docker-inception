<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wpdb' );

/** Database username */
define( 'DB_USER', 'majjig' );

/** Database password */
define( 'DB_PASSWORD', 'majjig@@A1' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'Xv9;AhFSi2WBYW:^PZ_?rdx1%iRqs9M,RT{1Z| X|NeN}DtO:EV&: ,$P|0^Yj&1' );
define( 'SECURE_AUTH_KEY',   'ty2BLoDksvp_Su4B#9ZiK|diWpU&yT./Q0L?zfF<C%9:o8V8Mrvwsm.3eH4uz* ?' );
define( 'LOGGED_IN_KEY',     'wf%EbQI.C>F*p`O+y=T2<OyYcSbX4qj++t=|?Jlme7H>!&:z/lp7N.czBrXaAh2P' );
define( 'NONCE_KEY',         'TPHkNgCjdV]J5:OSN(V#qIrf7xTTye;n8(X0sm]AHCdd!}6QwQ%A>_X<iN]`*bl}' );
define( 'AUTH_SALT',         ',FYq=I)$uxA4>]4m{aqNTBDDSt0ZL_mQO(tI;v030ns2g`Df#t?^T|&CDTh]pL$v' );
define( 'SECURE_AUTH_SALT',  'gXbg3x#TQ^#}L`qUV#%@cYJGAu|T;)U$IQh9M/)TKMhyI>zBJSz,;_$8sa9;@j~g' );
define( 'LOGGED_IN_SALT',    'vz?Sp=Vt7u2rTussQ1cG#Mmqb!h)uOu387s]=8%Cs6;OC3G~SnVvj.?):CQ)]Nqw' );
define( 'NONCE_SALT',        'C7Z/X@x+,k{`!#U>Sx*9g48oVkQ<i^^SM/;%J_3>xeQBEoD,C$OeBK{[.MGqBz}A' );
define( 'WP_CACHE_KEY_SALT', '}SX]OpeF&wx<V_/}Y)c[qHdw$(e`T@^)5;P,k=ce==!eB]mSo~FgP(C=p-_Vrvd6' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
