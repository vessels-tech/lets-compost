

## Domains:
letscompost.club
compostable.site
compostclub.site



## images:

- small logo image x 3
- banner image x 3
- image explaining projects in india 


## copy:
- price tiers
- CTa button titles
- Subtag line
- Steps



# invalidations

compostclub.site: E1PERSHLVIP9DJ
compostable.site: E25X1EFKRFH52L
letscompost.site: E33KH0DMR64EFM


```bash
aws configure set preview.cloudfront true
aws cloudfront create-invalidation --distribution-id E1PERSHLVIP9DJ --paths /css/core.css /index.html
aws cloudfront create-invalidation --distribution-id E25X1EFKRFH52L --paths /css/core.css /index.html
aws cloudfront create-invalidation --distribution-id E33KH0DMR64EFM --paths /css/core.css /index.html
```

