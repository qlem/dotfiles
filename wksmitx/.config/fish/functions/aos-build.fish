# Defined interactively
function aos-build --description 'Build AOS app'
    npx lerna clean --yes && npx lerna run clean && npm ci
end
