# Fractionalized-ERC721

This is a contract that extends the ERC-721 token standard to create a fractionalized token. The contract keeps track of the total number of shares that have been issued, as well as the number of shares held by each token. Each token represents a fraction of the underlying asset, and the number of shares held by each token is proportional to its share of ownership in the asset.

The mint function allows users to mint new tokens and assign them a specified number of shares. The number of shares for each token is stored in the tokenShares mapping.

The transferShares function allows users to transfer a specified number of shares from one token to another or from one user to another. The function creates new tokens to represent the transferred shares and destroys the original token that held the shares.

This is just a basic example, and there are many additional features and functionalities that can be added to a fractionalized ERC-721 token contract. It's important to keep in mind that creating a fractionalized token involves many other considerations beyond the code itself, including legal, regulatory, and operational aspects.
