{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Api where

import Servant
import Network.Wai (Application())

type YourApi
  = Get '[] ()

server :: Server YourApi
server = return ()

type AppAPI = YourApi :<|> Raw

app :: Application
app = serve (Proxy :: Proxy AppAPI) (server :<|> serveDirectory "ui/assets/")
