# jupyterhub_config.py
import os
c = get_config()

pjoin = os.path.join

runtime_dir = os.path.join('/srv/jupyterhub')
# ssl_dir = pjoin(runtime_dir, 'ssl')
# if not os.path.exists(ssl_dir):
#     os.makedirs(ssl_dir)


# https on :443
#c.JupyterHub.port = 443
#c.JupyterHub.ssl_key = pjoin(ssl_dir, 'ssl.key')
#c.JupyterHub.ssl_cert = pjoin(ssl_dir, 'ssl.cert')

# put the JupyterHub cookie secret and state db
# in /var/run/jupyterhub
c.JupyterHub.cookie_secret_file = pjoin(runtime_dir, 'cookie_secret')
c.JupyterHub.db_url = pjoin(runtime_dir, 'jupyterhub.sqlite')
# or `--db=/path/to/jupyterhub.sqlite` on the command-line

# use GitHub OAuthenticator for local users

# c.JupyterHub.authenticator_class = 'oauthenticator.LocalGitHubOAuthenticator'
# c.GitHubOAuthenticator.oauth_callback_url = os.environ['OAUTH_CALLBACK_URL']
# create system users that don't exist yet
c.LocalAuthenticator.create_system_users = True

# specify users and admin
c.Authenticator.whitelist = {'admin',
                             'user1', 'user2',
                             'user3', 'user4',
                             'user5',  'user6',
                             'user7',  'user8'
                             }
c.Authenticator.admin_users = {'admin'}

# specify default Spawner to JupyterLab
c.Spawner.cmd = ['jupyter-labhub']
#c.Spawner.default_url = '/lab'
