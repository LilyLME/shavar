swagger: "2.0"
host: ${HOST}
info:
  title: Shavar Service
  description: Mozilla's implementation of the Safe Browsing protocol
  contact:
    name: Luke Crouch
    email: lcrouch@mozilla.com
  license:
    name: MPL v2.0
    url: https://www.mozilla.org/en-US/MPL/2.0/
  version: ${VERSION}
  x-mozilla-services:
    homepage: https://github.com/mozilla-services/shavar
schemes:
    - ${SCHEME}
paths:
    /__heartbeat__:
      get:
        operationId: getHeartbeat
        description: Performs an heartbeat on the app
        produces:
        - text/plain
        responses:
          '200':
            description: The hearbeat was successfull
    /__version__:
      get:
        operationId: getVersion
        description: Returns the version
        produces:
        - text/json
        responses:
          '200':
            description: The version is returned
    /list:
      get:
        operationId: getList
        description: Returns the lists names ~ DEPRECATED, use POST
        produces:
        - text/plain
        responses:
          '200':
            description: The lists names are returned
      post:
        operationId: postList
        description: Returns the lists names
        produces:
        - text/plain
        responses:
          '200':
            description: The list names are returned
    /gethash:
      post:
        operationId: getHash
        description: Returns the data in chunks per line {list_name}:{chunk_number}:{data_len}\n{data}
        produces:
          - text/html
          - application/octet-stream
        responses:
          '400':
            description: unknown format
          '200':
            description: The version is returned
          '204':
            description: Nothing was found.
    /newkey:
      get:
        operationId: getNewKey
        description: Not implemented
        responses:
          '501':
            description: This API is not implemented
    /downloads:
      post:
        operationId: getDownloads
        description: returns a list of Safe Browsing URLs
        produces:
        - application/octet-stream
        parameters:
          - name: query
            in: body
            description: Shavar query string
            required: false
            schema:
              type: string
        responses:
            '200':
              description: List returned
            '400':
              description: Invalid Input
